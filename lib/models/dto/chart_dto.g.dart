// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDto _$AlbumDtoFromJson(Map<String, dynamic> json) {
  return AlbumDto(
    title: json['title'] as String,
    cover: json['cover_big'] as String,
    artist: json['artist']['name'] as String,
    urlTrackList: json['tracklist'] as String,
  );
}

Map<String, dynamic> _$AlbumDtoToJson(AlbumDto instance) => <String, dynamic>{
      'title': instance.title,
      'cover_medium': instance.cover,
      'artist': instance.artist,
    };
