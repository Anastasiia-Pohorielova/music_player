// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDto _$AlbumDtoFromJson(Map<String, dynamic> json) {
  return AlbumDto(
    title: json['title'] as String,
    cover: json['cover_medium'] as String,
    artist: ArtistDto.fromJson(json['artist'] as Map<String, dynamic>),
    tracklist: json['tracklist'] as String?,
  );
}

Map<String, dynamic> _$AlbumDtoToJson(AlbumDto instance) => <String, dynamic>{
      'title': instance.title,
      'cover_medium': instance.cover,
      'artist': instance.artist,
      'tracklist': instance.tracklist,
    };
