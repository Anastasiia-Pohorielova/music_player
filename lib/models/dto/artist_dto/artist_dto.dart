import 'package:json_annotation/json_annotation.dart';

part 'artist_dto.g.dart';

@JsonSerializable()
class ArtistDto {
  final String name;

  ArtistDto({
    required this.name,
  });

  factory ArtistDto.fromJson(Map<String, dynamic> json) => _$ArtistDtoFromJson(json);
}
