import 'package:music_player/models/playlist_model.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/album_store/album_selectors.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/player_store/player_selectors.dart';
import 'package:music_player/store/playlist/playlist_selectors.dart';
import 'package:redux/redux.dart';

class  PlayerPageVM {
  final List<PlaylistModel> playlist;
  final List<TrackModel> albumPlaylist;
  final void Function(String) createPlaylist;
  final List<TrackModel> playingTracklist;

  PlayerPageVM({
    required this.playlist,
    required this.albumPlaylist,
    required this.createPlaylist,
    required this.playingTracklist,
  });

  static PlayerPageVM fromStore(Store<AppState> store) {
    return PlayerPageVM(
      playlist:  PlaylistSelectors.getPlaylist(store),
      albumPlaylist: AlbumSelectors.getTrackList(store),
      createPlaylist: PlaylistSelectors.createNewPlaylist(store),
      playingTracklist: PlayerSelectors.getPlayingPlaylist(store),
    );
  }
}
