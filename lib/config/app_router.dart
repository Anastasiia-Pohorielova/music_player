import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:music_player/res/routes.dart';
import 'package:music_player/ui/pages/add_to_playlist_page/add_to_playlist_page.dart';
import 'package:music_player/ui/pages/album_page/album_page.dart';
import 'package:music_player/ui/pages/auth_page/auth_page.dart';
import 'package:music_player/ui/pages/auth_page/login_page.dart';
import 'package:music_player/ui/pages/auth_page/register_page.dart';
import 'package:music_player/ui/pages/home_page/home_page.dart';
import 'package:music_player/ui/pages/player_page/player_page.dart';
import 'package:music_player/ui/pages/playlist_page/playlist_page.dart';
import 'package:music_player/ui/pages/search_page/search_page.dart';

import 'package:music_player/config/app_config.dart';
export 'app_router.gr.dart';
import 'package:music_player/config/app_router.gr.dart';

AppRouter get router => getIt<AppRouter>();

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: Routes.enterPage,
      page: EnterPage,
      initial: true,
    ),
    AutoRoute(path: Routes.registerPage, page: RegisterPage,),
    AutoRoute(path: Routes.loginPage, page: AuthPage,),
    AutoRoute(
      path: Routes.homePage,
      page: HomePage,
    ),
    AutoRoute(
      path: Routes.playlistPage,
      page: PlaylistPage,
    ),
    AutoRoute(
      path: Routes.trackPage,
      page: PlayerPage,
    ),
    AutoRoute(
      path: Routes.addToPlaylistPage,
      page: AddToPlaylistPage,
    ),
    AutoRoute(
      path: Routes.trackPage,
      page: PlayerPage,
    ),
    AutoRoute(
      path: Routes.albumPage,
      page: AlbumPage,
    ),
    AutoRoute(
      path: Routes.searchPage,
      page: SearchPage,
    ),
  ],
)

class $AppRouter {}
