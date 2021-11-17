import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';
import 'package:music_player/services/network_service/interfaces/i_base_request.dart';

class GetRequestModel implements IBaseRequest {
  final String? url;
  final Map<String, String>? headers;

  GetRequestModel({
    this.url,
    this.headers,
  });

  @override
  Future<Response> call() {
    return http.get(
        Uri.parse(url!),
      headers: headers,
    );
  }
}
