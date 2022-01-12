import 'package:music_player/models/playlist_model.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/playlist/playlist_selectors.dart';
import 'package:redux/redux.dart';

class AddToPlaylistPageVM {
  final List<PlaylistModel> playlist;
  final void Function(TrackModel, String) addTrack;
  final void Function(int) deleteTrack;

  AddToPlaylistPageVM({
    required this.addTrack,
    required this.deleteTrack,
    required this.playlist,
  });

  static AddToPlaylistPageVM fromStore(Store<AppState> store) {
    return AddToPlaylistPageVM(
      addTrack: PlaylistSelectors.addToPlaylist(store),
      deleteTrack: PlaylistSelectors.deleteFromPlaylist(store),
      playlist: PlaylistSelectors.getPlaylist(store),
    );
  }
}
