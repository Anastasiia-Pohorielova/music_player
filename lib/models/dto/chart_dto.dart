import 'package:json_annotation/json_annotation.dart';
part 'chart_dto.g.dart';

@JsonSerializable()
class AlbumDto {
  final String title;
  final String cover;
  final String artist;
  final String urlTrackList;

  AlbumDto({
    required this.title,
    required this.cover,
    required this.artist,
    required this.urlTrackList,
  });

  factory AlbumDto.fromJson(Map<String, dynamic> json) => _$AlbumDtoFromJson(json);
}
