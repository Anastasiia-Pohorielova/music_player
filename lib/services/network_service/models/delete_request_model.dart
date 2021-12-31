import 'package:dio/dio.dart';
import 'package:music_player/services/network_service/interfaces/i_base_request.dart';

class DeleteRequestModel implements IBaseRequest {
  final String? url;
  final Map<String, String>? headers;

  DeleteRequestModel({
    this.url,
    this.headers,
  });

  @override
  Future<Response> call() {
    return Dio().delete(
      url!,
      options: Options(
        headers: headers,
      ),
    );
  }
}
