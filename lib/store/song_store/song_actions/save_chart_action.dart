import 'package:music_player/models/dto/chart_dto.dart';

class SaveChartAction {
  final List<AlbumDto> chartList;
  SaveChartAction({required this.chartList});
}