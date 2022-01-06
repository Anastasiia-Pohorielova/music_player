import 'package:json_annotation/json_annotation.dart';
import 'package:music_player/models/dto/artist_dto/artist_dto.dart';

part 'track_dto.g.dart';

@JsonSerializable()
class TrackDto {
  final String title;
  final int duration;
  final String preview;
  final int? id;
  final ArtistDto artist;

  const TrackDto({
    required this.title,
    required this.duration,
    required this.preview,
    required this.artist,
    this.id,
  });

  factory TrackDto.fromJson(Map<String, dynamic> json) => _$TrackDtoFromJson(json);

}
