// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartDto _$ChartDtoFromJson(Map<String, dynamic> json) {
  return ChartDto(
    title: json['title'] as String,
    picture: json['album']['cover'] as String,
    album: json['album']['title'] as String,
    duration: json['duration'] as int,
    songLink: json['link'] as String,
    artist: json['artist']['name'] as String,
  );
}

Map<String, dynamic> _$ChartDtoToJson(ChartDto instance) => <String, dynamic>{
      'title': instance.title,
      'picture': instance.picture,
      'album': instance.album,
      'songLink': instance.songLink,
      'duration': instance.duration,
    };
