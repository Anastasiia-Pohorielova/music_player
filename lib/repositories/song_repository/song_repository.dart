import 'package:music_player/models/dto/chart_dto.dart';
import 'package:music_player/services/song_service/song_service.dart';
import 'package:music_player/store/song_store/song_actions/get_chart_action.dart';
import 'package:music_player/store/song_store/song_actions/get_track_by_key_action.dart';

class SongRepository {
  SongRepository._privateConstructor();

   static final SongRepository instance = SongRepository._privateConstructor();

  Future<List<ChartDto>?> getChart(GetChartAction action) async {
    return SongService.instance.getChart(action);
  }

  Future<List<ChartDto>?> getTrackByKey(GetTrackByKeyAction action) async {
    return SongService.instance.getTrackByKeyword(action);
  }
}