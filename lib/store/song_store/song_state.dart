import 'dart:collection';

import 'package:music_player/models/dto/chart_dto.dart';
import 'package:music_player/store/shared/reducer.dart';
import 'package:music_player/store/song_store/song_actions/save_chart_action.dart';

class SongState {
  final List<ChartDto> chartPlaylist;


  const SongState({required this.chartPlaylist});

  factory SongState.initial() {
    return SongState(
      chartPlaylist: <ChartDto>[]
    );
  }

  SongState copyWith({
    required List<ChartDto> chartPlaylist,
  }) {
    return SongState(
      chartPlaylist: chartPlaylist,
    );
  }

  SongState reducer(dynamic action) {
    return Reducer<SongState>(
        actions: HashMap.from({
          SaveChartAction: (dynamic action) => _saveChart(action),
        })).updateState(action, this);
  }

  SongState _saveChart(SaveChartAction action) {
    return copyWith(chartPlaylist: action.chartList);
  }

}
