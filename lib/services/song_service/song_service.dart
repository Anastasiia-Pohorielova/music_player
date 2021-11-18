import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:music_player/models/dto/chart_dto.dart';
import 'package:music_player/store/song_store/song_actions/get_chart_action.dart';
import 'package:music_player/store/song_store/song_actions/get_track_by_key_action.dart';

class SongService {
  SongService._privateConstructor();
  static final SongService instance = SongService._privateConstructor();

  Future<List<ChartDto>?> getChart(GetChartAction action) async {
    final response = await Dio().get('https://api.deezer.com/chart/0');
    if (response.statusCode == 200) {
      final decodedJsonList = jsonDecode(response.toString())['tracks']['data'];
      final List<ChartDto> chartList = List<ChartDto>.from(decodedJsonList.map((json) => ChartDto.fromJson(json)));

      return chartList.map((ChartDto chartDto) => ChartDto(
        title: chartDto.title,
        album: chartDto.album,
        duration: chartDto.duration,
        picture: chartDto.picture,
        songLink: chartDto.songLink,
        artist: chartDto.artist,
      )).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<ChartDto>?> getTrackByKeyword(GetTrackByKeyAction action) async {
    final response = await Dio().get('https://api.deezer.com/search?q=${action.key}');
    if (response.statusCode == 200) {
      final decodedJsonList = jsonDecode(response.toString())['tracks']['data'];
      final List<ChartDto> chartList = List<ChartDto>.from(decodedJsonList.map((json) => ChartDto.fromJson(json)));

      return chartList.map((ChartDto chartDto) => ChartDto(
        title: chartDto.title,
        album: chartDto.album,
        duration: chartDto.duration,
        picture: chartDto.picture,
        songLink: chartDto.songLink,
        artist: chartDto.artist,
      )).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }


}