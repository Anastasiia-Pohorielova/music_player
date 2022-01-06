import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/pages/album_page_data.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/services/route_service/res/routes.dart';
import 'package:music_player/ui/pages/add_to_playlist_page/add_to_playlist_page.dart';
import 'package:music_player/ui/pages/album_page/album_page.dart';
import 'package:music_player/ui/pages/auth_page/login_page.dart';
import 'package:music_player/ui/pages/auth_page/auth_page.dart';
import 'package:music_player/ui/pages/auth_page/register_page.dart';
import 'package:music_player/ui/pages/home_page/home_page.dart';
import 'package:music_player/ui/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:music_player/ui/pages/player_page/player_page.dart';
import 'package:music_player/ui/pages/playlist_page/playlist_page.dart';
import 'package:music_player/ui/pages/search_page/search_page.dart';

class RouteBuilder {
  static const String TAG = '[RouteBuilder]';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.searchPage:
        return _defaultRoute(
          page: SearchPage(),
          settings: settings,
        );
      case Routes.addToPlaylistPage:
        final TrackModel trackData = settings.arguments as TrackModel;
        return _defaultRoute(
          page: AddToPlaylistPage(newTrack: trackData),
          settings: settings,
        );
      case Routes.homePage:
        return _defaultRoute(
          page: HomePage(),
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
      case Routes.playlistPage:
        final PlaylistPageData data = settings.arguments as PlaylistPageData;
        return _defaultRoute(
          page: PlaylistPage(playlistTitle: data.title),
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
            artistName: data.artistName,
          ),
          settings: settings,
        );
      default:
        return _defaultRoute(
          settings: settings,
          page: EnterPage(),
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
