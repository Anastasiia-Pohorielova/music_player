import 'package:json_annotation/json_annotation.dart';
import 'package:music_player/models/dto/artist_dto/artist_dto.dart';

part 'album_dto.g.dart';

@JsonSerializable()
class AlbumDto {
  final String title;
  @JsonKey(name: 'cover_medium')
  final String cover;
  final ArtistDto artist;
  final String? tracklist;

  AlbumDto({
    required this.title,
    required this.cover,
    required this.artist,
    this.tracklist,
  });

  factory AlbumDto.fromJson(Map<String, dynamic> json) => _$AlbumDtoFromJson(json);

}
