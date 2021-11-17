import 'package:music_player/services/network_service/network_service.dart';

/// Interface for all basic errors. Does using in [NetworkService].
class IBaseError {
  int? statusCode;
  String? error;

  IBaseError({this.error, this.statusCode});
}