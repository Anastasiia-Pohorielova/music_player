// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../models/dto/album_dto.dart' as _i13;
import '../models/track_model.dart' as _i12;
import '../ui/pages/add_to_playlist_page/add_to_playlist_page.dart' as _i9;
import '../ui/pages/album_page/album_page.dart' as _i10;
import '../ui/pages/auth_page/auth_page.dart' as _i3;
import '../ui/pages/auth_page/login_page.dart' as _i5;
import '../ui/pages/auth_page/register_page.dart' as _i4;
import '../ui/pages/home_page/home_page.dart' as _i6;
import '../ui/pages/player_page/player_page.dart' as _i8;
import '../ui/pages/playlist_page/playlist_page.dart' as _i7;
import '../ui/pages/search_page/search_page.dart' as _i11;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    EnterRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.EnterPage();
        }),
    RegisterRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.RegisterPage();
        }),
    AuthRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.AuthPage();
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.HomePage();
        }),
    PlaylistRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PlaylistRouteArgs>();
          return _i7.PlaylistPage(
              playlistTitle: args.playlistTitle, key: args.key);
        }),
    PlayerRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PlayerRouteArgs>();
          return _i8.PlayerPage(
              albumTitle: args.albumTitle,
              cover: args.cover,
              id: args.id,
              trackId: args.trackId,
              artistName: args.artistName,
              key: args.key);
        }),
    AddToPlaylistRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<AddToPlaylistRouteArgs>();
          return _i9.AddToPlaylistPage(newTrack: args.newTrack, key: args.key);
        }),
    AlbumRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<AlbumRouteArgs>();
          return _i10.AlbumPage(
              index: args.index, album: args.album, key: args.key);
        }),
    SearchRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i11.SearchPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: '/enter-page', fullMatch: true),
        _i1.RouteConfig(EnterRoute.name, path: '/enter-page'),
        _i1.RouteConfig(RegisterRoute.name, path: 'register'),
        _i1.RouteConfig(AuthRoute.name, path: 'login'),
        _i1.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i1.RouteConfig(PlaylistRoute.name, path: 'playlist-page'),
        _i1.RouteConfig(PlayerRoute.name, path: 'track_page'),
        _i1.RouteConfig(AddToPlaylistRoute.name, path: 'add-to-playlist-page'),
        _i1.RouteConfig(PlayerRoute.name, path: 'track_page'),
        _i1.RouteConfig(AlbumRoute.name, path: 'album_page'),
        _i1.RouteConfig(SearchRoute.name, path: '/search_page')
      ];
}

class EnterRoute extends _i1.PageRouteInfo {
  const EnterRoute() : super(name, path: '/enter-page');

  static const String name = 'EnterRoute';
}

class RegisterRoute extends _i1.PageRouteInfo {
  const RegisterRoute() : super(name, path: 'register');

  static const String name = 'RegisterRoute';
}

class AuthRoute extends _i1.PageRouteInfo {
  const AuthRoute() : super(name, path: 'login');

  static const String name = 'AuthRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home-page');

  static const String name = 'HomeRoute';
}

class PlaylistRoute extends _i1.PageRouteInfo<PlaylistRouteArgs> {
  PlaylistRoute({required String playlistTitle, _i2.Key? key})
      : super(name,
            path: 'playlist-page',
            args: PlaylistRouteArgs(playlistTitle: playlistTitle, key: key));

  static const String name = 'PlaylistRoute';
}

class PlaylistRouteArgs {
  const PlaylistRouteArgs({required this.playlistTitle, this.key});

  final String playlistTitle;

  final _i2.Key? key;
}

class PlayerRoute extends _i1.PageRouteInfo<PlayerRouteArgs> {
  PlayerRoute(
      {required String albumTitle,
      required String cover,
      required int id,
      required String trackId,
      required String artistName,
      _i2.Key? key})
      : super(name,
            path: 'track_page',
            args: PlayerRouteArgs(
                albumTitle: albumTitle,
                cover: cover,
                id: id,
                trackId: trackId,
                artistName: artistName,
                key: key));

  static const String name = 'PlayerRoute';
}

class PlayerRouteArgs {
  const PlayerRouteArgs(
      {required this.albumTitle,
      required this.cover,
      required this.id,
      required this.trackId,
      required this.artistName,
      this.key});

  final String albumTitle;

  final String cover;

  final int id;

  final String trackId;

  final String artistName;

  final _i2.Key? key;
}

class AddToPlaylistRoute extends _i1.PageRouteInfo<AddToPlaylistRouteArgs> {
  AddToPlaylistRoute({required _i12.TrackModel newTrack, _i2.Key? key})
      : super(name,
            path: 'add-to-playlist-page',
            args: AddToPlaylistRouteArgs(newTrack: newTrack, key: key));

  static const String name = 'AddToPlaylistRoute';
}

class AddToPlaylistRouteArgs {
  const AddToPlaylistRouteArgs({required this.newTrack, this.key});

  final _i12.TrackModel newTrack;

  final _i2.Key? key;
}

class AlbumRoute extends _i1.PageRouteInfo<AlbumRouteArgs> {
  AlbumRoute({required int index, required _i13.AlbumDto album, _i2.Key? key})
      : super(name,
            path: 'album_page',
            args: AlbumRouteArgs(index: index, album: album, key: key));

  static const String name = 'AlbumRoute';
}

class AlbumRouteArgs {
  const AlbumRouteArgs({required this.index, required this.album, this.key});

  final int index;

  final _i13.AlbumDto album;

  final _i2.Key? key;
}

class SearchRoute extends _i1.PageRouteInfo {
  const SearchRoute() : super(name, path: '/search_page');

  static const String name = 'SearchRoute';
}
