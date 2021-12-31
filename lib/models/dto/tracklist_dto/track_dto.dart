import 'package:json_annotation/json_annotation.dart';

part 'track_dto.g.dart';

@JsonSerializable()
class TrackDto {
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
