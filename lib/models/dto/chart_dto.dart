import 'package:json_annotation/json_annotation.dart';
part 'chart_dto.g.dart';

@JsonSerializable()
class ChartDto {
  final String title;
  final String picture;
  final String album;
  final String songLink;
  final int duration;
  final String artist;

  ChartDto({
    required this.title,
    required this.picture,
    required this.album,
    required this.duration,
    required this.songLink,
    required this.artist,
  });

  factory ChartDto.fromJson(Map<String, dynamic> json) => _$ChartDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChartDtoToJson(this);
}
