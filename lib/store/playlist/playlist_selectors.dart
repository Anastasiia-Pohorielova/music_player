import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/playlist/playlist_actions/add_to_playlist_action.dart';
import 'package:music_player/store/playlist/playlist_actions/delete_from_playlist_action.dart';
import 'package:music_player/store/playlist/playlist_actions/get_palylist_action.dart';
import 'package:redux/redux.dart';

class PlaylistSelectors {

  static Function() getPlaylistFromApi(Store<AppState> store) {
    return () => store.dispatch(GetPlaylistAction());
  }

  static List<TrackDto> getPlaylist(Store<AppState> store) {
    return store.state.playlistState.playlist;
  }

  static Function(String) addToPlaylist(Store<AppState> store) {
    return (trackId) => store.dispatch(AddToPlaylistAction(trackId: trackId));
  }

  static Function(String) deleteFromPlaylist(Store<AppState> store) {
    return (trackId) => store.dispatch(DeleteFromPlaylistAction(trackId: trackId));
  }
}
