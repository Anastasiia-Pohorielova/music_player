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
    trackId: json['id'] as int,
  );
}

Map<String, dynamic> _$TrackDtoToJson(TrackDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'duration': instance.duration,
    };
