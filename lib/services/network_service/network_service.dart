import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:music_player/services/network_service/interfaces/i_base_error.dart';
import 'package:music_player/services/network_service/interfaces/i_base_http_error.dart';
import 'package:music_player/services/network_service/interfaces/i_base_request.dart';
import 'package:music_player/services/network_service/models/base_http_response.dart';
import 'package:music_player/services/network_service/res/consts.dart';
import 'package:music_player/services/network_service/shared/request_builders.dart';

/// [NetworkService] it is Service for get data from server.
/// In our architecture we does use this service from [Request] classes from [network/requests/] folder.
/// This service have a prams:
/// variables:
///   - [baseUrl]. This variable does set with [init] method or [overrideBaseUrl]. This variable does contains a base link for http requests.
///   - [_errors]. This list does initialize with [init] method. This list does contains all specific errors for Network.
/// methods:
///   - [init]. This method will initialize [_errors] and [baseUrl] variables. It should be used after start of application in [initializeEpic].
///   - [request]. This is a main method of [NetworkService]. This method will return a [BaseHttpResponse].
///   - [overrideBaseUrl]. This method can set a new value to [baseUrl].
///   - [_getCheckedForErrorResponse]. This method will check a response for all basic errors.
///   - [_checkInternetConnection]. This method will check internet connection of app.
///   - [_getErrorByCode]. This method will return a error text by error code.
class NetworkService {
  static const tag = '[NetworkService]';

  NetworkService._privateConstructor();

  static final NetworkService _instance = NetworkService._privateConstructor();

  static NetworkService get instance => _instance;

  /// Basic url for requests. This variable will use as default but can be updated by [overrideBaseUrl].
  /// All request builders use this variable for build request but also have a param [url].
  late String baseUrl;

  /// Basic errors. This list does using by [_getErrorByCode] and [_getCheckedForErrorResponse] for check errors.
  List<IBaseError> _errors = [];

  /// This function will update a [baseUrl]. Not required for use.
  void overrideBaseUrl(String url) => baseUrl = baseUrl;

  void init({
    required String baseUrl,
    required List<IBaseError> errors,
  }) {
    baseUrl = baseUrl;
    _errors = errors;
  }

  /// Main function of [NetworkService]. This function will use for get data from server.
  /// params:
  ///   - [request]. Will accept object extended from [IBaseRequest]. List of main request types will contains in [RequestBuilders] class.
  Future<BaseHttpResponse> request(IBaseRequest request) async {

    final Response response = await request();

  //  logger.d(response.data);

    return _getCheckedForErrorResponse(response);
  }

  /// This function will check a response for main errors.
  /// params:
  ///   - [response]. This params we will get from [http.get] or etc functions.
  BaseHttpResponse _getCheckedForErrorResponse(Response response) {
    if (response.statusCode! < httpOk || response.statusCode! > httpMaxOk) {
      return BaseHttpResponse(
        response: response.data,
        error: IBaseHttpError(
          error: response.statusMessage,
          statusCode: response.statusCode,
        ),
      );
    }

    if (response.statusCode == httpUnprocessable) {
      try {
        final Map<String, dynamic> responseBody = jsonDecode(response.data);

        final int code = responseBody[data];
        final String? error = _getErrorByCode(code);

        if (error == null) {
          return BaseHttpResponse(
            response: response.data,
            error: IBaseHttpError(
              error: response.statusMessage,
              statusCode: response.statusCode,
            ),
          );
        }

        return BaseHttpResponse(
          response: response.data,
          error: IBaseHttpError(
            error: error,
            statusCode: code,
          ),
        );
      } catch (e) {
        return BaseHttpResponse(
          response: response.data,
          error: IBaseHttpError(
            error: response.statusMessage,
            statusCode: response.statusCode,
          ),
        );
      }
    }

    return BaseHttpResponse(
      response: response.data,
    );
  }

  /// This functions will get a error text by error code.
  String? _getErrorByCode(int code) {
    for (IBaseError error in _errors) {
      if (error.statusCode == code) {
        return error.error;
      }
    }

    return null;
  }
}
