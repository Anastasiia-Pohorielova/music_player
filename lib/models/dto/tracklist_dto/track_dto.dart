import 'package:json_annotation/json_annotation.dart';
import 'package:music_player/models/pages/interfaces/i_page_data.dart';

part 'track_dto.g.dart';

@JsonSerializable()
class TrackDto  implements IPageData{
  final String title;
  final int duration;
  final String preview;
  final int trackId;

  const TrackDto({
    required this.title,
    required this.duration,
    required this.preview,
    required this.trackId,
  });

  factory TrackDto.fromJson(Map<String, dynamic> json) => _$TrackDtoFromJson(json);
}
