import 'package:music_player/models/pages/interfaces/i_page_data.dart';
import 'package:music_player/models/playlist_model.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/playlist/playlist_selectors.dart';
import 'package:music_player/store/shared/route_navigator/route_selectors.dart';
import 'package:redux/redux.dart';

class  PlaylistPageVM {
  final List<PlaylistModel> playlist;
  final void Function(IPageData) goToTrackPage;
  final void Function() startPlaying;
  final void Function() stopPlaying;
  final bool isPlaying;
  final void Function(List<TrackModel>) getPlayingTracklist;
  final List<TrackModel> playingPlaylist;

  PlaylistPageVM({
    required this.playlist,
    required this.goToTrackPage,
    required this.startPlaying,
    required this.stopPlaying,
    required this.isPlaying,
    required this.getPlayingTracklist,
    required this.playingPlaylist,
  });

  static PlaylistPageVM fromStore(Store<AppState> store) {
    return PlaylistPageVM(
      playlist:  PlaylistSelectors.getPlaylist(store),
      goToTrackPage: RouteSelectors.goToTrackPage(store),
      startPlaying: PlaylistSelectors.startPlaying(store),
      stopPlaying: PlaylistSelectors.stopPlaying(store),
      isPlaying: PlaylistSelectors.isPlaying(store),
      getPlayingTracklist: PlaylistSelectors.addPlaylistToListen(store),
      playingPlaylist: PlaylistSelectors.getPlayingPlaylist(store),
    );
  }
}
