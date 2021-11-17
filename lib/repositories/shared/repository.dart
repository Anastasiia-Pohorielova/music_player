import 'package:music_player/adapters/interfaces/i_adapter.dart';

class Repository {
  Future<T> repository<T>(IAdapter adapter) async {
    return await adapter();
  }
}