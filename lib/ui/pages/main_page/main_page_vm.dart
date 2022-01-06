import 'package:music_player/store/album_store/album_selectors.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:redux/redux.dart';

class MainPageVM {
  final void Function() getChart;
  final void Function(String) getTracksByKey;

  MainPageVM({
    required this.getChart,
    required this.getTracksByKey,
  });

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(
      getChart: AlbumSelectors.getChartListFromApi(store),
      getTracksByKey: AlbumSelectors.getTrackByKey(store),
    );
  }
}
