import 'package:music_player/network/shared/i_request.dart';

/// Interface for adapters for http requests.
abstract class IAdapter<T> {
  final IRequest? request;

  IAdapter({this.request});

  Future<T> call();
}