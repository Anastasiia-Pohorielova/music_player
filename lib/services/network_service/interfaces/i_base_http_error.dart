import 'package:music_player/services/network_service/network_service.dart';

/// Interface created for httpErrors. Does using from [NetworkService]
class IBaseHttpError {
  final int statusCode;
  final String? error;

  IBaseHttpError({
    required this.error,
    required this.statusCode,
  });
}
