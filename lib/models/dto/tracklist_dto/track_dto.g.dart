// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackDto _$TrackDtoFromJson(Map<String, dynamic> json) {
  return TrackDto(
    title: json['title'] as String,
    duration: json['duration'] as int,
    preview: json['preview'] as String,
    artist: ArtistDto.fromJson(json['artist'] as Map<String, dynamic>),
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$TrackDtoToJson(TrackDto instance) => <String, dynamic>{
      'title': instance.title,
      'duration': instance.duration,
      'preview': instance.preview,
      'id': instance.id,
      'artist': instance.artist,
    };
