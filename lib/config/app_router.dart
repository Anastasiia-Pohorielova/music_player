import 'package:auto_route/auto_route.dart';
import 'package:music_player/services/route_service/res/routes.dart';
import 'package:music_player/ui/pages/album_page/album_page.dart';
import 'package:music_player/ui/pages/auth_page/auth_page.dart';
import 'package:music_player/ui/pages/auth_page/login_page.dart';
import 'package:music_player/ui/pages/auth_page/register_page.dart';
import 'package:music_player/ui/pages/home_page/home_page.dart';
import 'package:music_player/ui/pages/player_page/player_page.dart';
import 'package:music_player/ui/pages/playlist_page/playlist_page.dart';
import 'package:music_player/ui/pages/search_page/search_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: Routes.enterPage,
      page: EnterPage,
      initial: true,
      children: [
        AutoRoute(path: Routes.registerPage, page: RegisterPage),
        AutoRoute(path: Routes.loginPage, page: AuthPage),
        RedirectRoute(path: '*', redirectTo: Routes.registerPage),
      ],
    ),
    AutoRoute(
      path: Routes.homePage,
      page: HomePage,
      children: [
        AutoRoute(
          path: Routes.playlistPage,
          page: PlaylistPage,
          children: [
            AutoRoute(
              path: Routes.trackPage,
              page: PlayerPage,
            ),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: Routes.searchPage,
      page: SearchPage,
      children: [
        AutoRoute(
          path: Routes.albumPage,
          page: AlbumPage,
          children: [
            AutoRoute(
              path: Routes.trackPage,
              page: PlayerPage,
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
