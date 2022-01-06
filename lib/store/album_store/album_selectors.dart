import 'package:music_player/models/dto/album_dto.dart';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/album_store/album_actions/get_album_action.dart';
import 'package:music_player/store/album_store/album_actions/get_chart_action.dart';
import 'package:music_player/store/album_store/album_actions/get_track_by_key_action.dart';
import 'package:music_player/store/album_store/album_actions/get_tracklist_action.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:redux/redux.dart';

class AlbumSelectors {
  static Function() getChartListFromApi(Store<AppState> store) {
    return () => store.dispatch(GetChartAction());
  }

  static Function(String) getTrackByKey(Store<AppState> store) {
    return (key) => store.dispatch(GetTrackByKeyAction(key: key));
  }

  static List<AlbumDto> getAlbumList(Store<AppState> store) {
    return store.state.songState.albums;
  }

  static Function(String) getAlbumsBySearch(Store<AppState> store) {
    return (key) => store.dispatch(GetAlbumAction(key: key));
  }

  static List<TrackModel> getTrackList(Store<AppState> store) {
    return store.state.songState.trackList;
  }

  static Function(int) getTrackListFromApi(Store<AppState> store) {
    return (id) => store.dispatch(GetTracklistAction(id: id));
  }
}
