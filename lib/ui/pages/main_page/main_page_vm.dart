import 'package:music_player/models/dto/chart_dto.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/song_store/song_selectors.dart';
import 'package:redux/redux.dart';

class MainPageVM {
  final void Function() getChart;
  final void Function(String) getTracksByKey;
  final List<ChartDto> chart;

  MainPageVM({
    required this.chart,
    required this.getChart,
    required this.getTracksByKey,
  });

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(
      getChart: SongSelectors.getChartListFromApi(store),
      chart: SongSelectors.getChartList(store),
      getTracksByKey: SongSelectors.getTrackByKey(store),
    );
  }
}
