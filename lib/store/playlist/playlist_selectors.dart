import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/playlist_model.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/playlist/playlist_actions/add_to_playlist_action.dart';
import 'package:music_player/store/playlist/playlist_actions/create_new_playlist_action.dart';
import 'package:music_player/store/playlist/playlist_actions/delete_from_playlist_action.dart';
import 'package:music_player/store/playlist/playlist_actions/get_palylist_action.dart';
import 'package:redux/redux.dart';

class PlaylistSelectors {

  static Function() getPlaylistFromApi(Store<AppState> store) {
    return () => store.dispatch(GetPlaylistAction());
  }

  static List<PlaylistModel> getPlaylist(Store<AppState> store) {
    return store.state.playlistState.playlists;
  }

  static Function(TrackModel, String) addToPlaylist(Store<AppState> store) {
    return (newTrack, title) => store.dispatch(AddToPlaylistAction(newTrack: newTrack, playlistTitle: title));
  }

  static Function(String) createNewPlaylist(Store<AppState> store) {
    return (title) => store.dispatch(CreateNewPlaylistAction(title: title));
  }

  static Function(int) deleteFromPlaylist(Store<AppState> store) {
    return (trackId) => store.dispatch(DeleteFromPlaylistAction(trackId: trackId));
  }
}
