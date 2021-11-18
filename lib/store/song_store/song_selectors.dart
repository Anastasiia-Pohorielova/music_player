import 'package:music_player/models/dto/chart_dto.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/song_store/song_actions/get_chart_action.dart';
import 'package:music_player/store/song_store/song_actions/get_track_by_key_action.dart';
import 'package:redux/redux.dart';

class SongSelectors {
  static List<ChartDto> getChartList(Store<AppState> store) {
    return store.state.songState.chartPlaylist;
  }

  static Function() getChartListFromApi(Store<AppState> store) {
    return () => store.dispatch(GetChartAction());
  }

  static Function(String) getTrackByKey(Store<AppState> store) {
    return (key) => store.dispatch(GetTrackByKeyAction(key: key));
  }
}
