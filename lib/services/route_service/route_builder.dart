import 'package:music_player/models/pages/album_page_data.dart';
import 'package:music_player/services/route_service/res/routes.dart';
import 'package:music_player/ui/pages/album_page/album_page.dart';
import 'package:music_player/ui/pages/auth_page/auth_page.dart';
import 'package:music_player/ui/pages/auth_page/enter_page.dart';
import 'package:music_player/ui/pages/auth_page/register_page.dart';
import 'package:music_player/ui/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:music_player/ui/pages/player_page/player_page.dart';
import 'package:music_player/ui/pages/search_page/search_page.dart';

class RouteBuilder {
  static const String TAG = '[RouteBuilder]';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainPage:
        return _defaultRoute(
          page: MainPage(),
          settings: settings,
        );
      case Routes.searchPage:
        return _defaultRoute(
          page: SearchPage(),
          settings: settings,
        );
      case Routes.loginPage:
        return _defaultRoute(
          page: AuthPage(),
          settings: settings,
        );
      case Routes.enterPage:
        return _defaultRoute(
          page: EnterPage(),
          settings: settings,
        );
      case Routes.registerPage:
        return _defaultRoute(
          page: RegisterPage(),
          settings: settings,
        );
      case Routes.albumPage:
        final AlbumPageData data = settings.arguments as AlbumPageData;
        return _defaultRoute(
          page: AlbumPage(
            index: data.index,
            album: data.album,
          ),
          settings: settings,
        );
      case Routes.trackPage:
        final PlayerPageData data = settings.arguments as PlayerPageData;
        return _defaultRoute(
          page: PlayerPage(
            albumTitle: data.albumTitle,
            cover: data.cover,
            id: data.id,
            trackId: data.trackId,
          ),
          settings: settings,
        );
      default:
        return _defaultRoute(
          settings: settings,
          page: MainPage(),
        );
    }
  }

  static PageRoute _defaultRoute({
    required RouteSettings settings,
    required Widget page,
  }) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page,
    );
  }
}
