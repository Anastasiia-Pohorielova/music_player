import 'package:injectable/injectable.dart';

import 'package:music_player/config/app_router.gr.dart';

@module
abstract class PlatformModules {
  @singleton
  @factoryMethod
  AppRouter get router => AppRouter();
}
