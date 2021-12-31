import 'package:dio/dio.dart';
import 'package:music_player/services/network_service/interfaces/i_base_request.dart';

class PutRequestModel implements IBaseRequest {
  final String? url;
  final Map<String, String>? headers;
  final Map<String, String>? data;

  PutRequestModel({
    this.url,
    this.headers,
    this.data,
  });

  @override
  Future<Response> call() {
    return Dio().put(
      url!,
      options: Options(
        headers: headers,
      ),
      data: data,
    );
  }
}
