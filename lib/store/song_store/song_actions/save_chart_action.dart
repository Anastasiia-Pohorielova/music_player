import 'package:music_player/models/dto/chart_dto.dart';

class SaveChartAction {
  final List<ChartDto> chartList;
  SaveChartAction({required this.chartList});
}