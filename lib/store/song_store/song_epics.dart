import 'package:music_player/models/dto/chart_dto.dart';
import 'package:music_player/repositories/song_repository/song_repository.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/song_store/song_actions/get_chart_action.dart';
import 'package:music_player/store/song_store/song_actions/get_track_by_key_action.dart';
import 'package:music_player/store/song_store/song_actions/save_chart_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class SongEpics {
  static final indexEpic = combineEpics<AppState>([
    getChartEpic,
  ]);

  static Stream<dynamic> getChartEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetChartAction>().switchMap((action) async* {
        final List<ChartDto>? chart = await SongRepository.instance.getChart(action);
        if (chart == null) {
          return;
        }
        yield SaveChartAction(chartList: chart);
    });
  }

  static Stream<dynamic> getTrackByKey(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetTrackByKeyAction>().switchMap((action) async* {
      final List<ChartDto>? chart = await SongRepository.instance.getTrackByKey(action);
      if (chart == null) {
        return;
      }
      yield SaveChartAction(chartList: chart);
    });
  }

}