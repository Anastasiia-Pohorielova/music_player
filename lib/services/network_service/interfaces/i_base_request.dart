import 'package:dio/dio.dart';
import 'package:music_player/services/network_service/shared/request_builders.dart';

/// Interface of BaseRequests. All main examples of [IBaseRequest] contains in [RequestBuilders] class.
abstract class IBaseRequest {
  Future<Response> call();
}