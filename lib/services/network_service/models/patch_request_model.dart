import 'package:dio/dio.dart';
import 'package:music_player/services/network_service/interfaces/i_base_request.dart';

class PatchRequestModel implements IBaseRequest {
  final String? url;
  final Map<String, String>? headers;
  final Map<String, String>? data;

  PatchRequestModel({
    this.url,
    this.headers,
    this.data,
  });

  @override
  Future<Response> call() {
    return Dio().patch(
      url!,
      options: Options(
        headers: headers,
      ),
      data: data,
    );
  }
}
