import 'dart:convert';

import 'package:music_player/models/dto/album_dto.dart';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/services/network_service/models/get_request_model.dart';
import 'package:music_player/services/network_service/network_service.dart';
import 'package:music_player/store/album_store/album_actions/get_album_action.dart';
import 'package:music_player/store/album_store/album_actions/get_tracklist_action.dart';

class AlbumService {
  AlbumService._privateConstructor();

  static final AlbumService instance = AlbumService._privateConstructor();

  Future<List<AlbumDto>?> getAlbum(GetAlbumAction action) async {
    final response = await NetworkService.instance.request(GetRequestModel(url: 'https://api.deezer.com/search/album?q=${action.key}'));
    if (response.error == null) {
      final decodedJsonList = jsonDecode(jsonEncode(response.response))['data'];
      final List<AlbumDto> albumsList = List<AlbumDto>.from(decodedJsonList.map((json) => AlbumDto.fromJson(json)));

      return albumsList
          .map((AlbumDto albumDto) => AlbumDto(
                tracklist: albumDto.tracklist,
                artist: albumDto.artist,
                title: albumDto.title,
                cover: albumDto.cover,
              ))
          .toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<TrackDto>?> getTrackList(GetTracklistAction action, String url) async {
    final response = await NetworkService.instance.request(GetRequestModel(url: url));
    if (response.error == null) {
      final decodedJsonList = jsonDecode(jsonEncode(response.response))['data'];
      final List<TrackDto> trackList = List<TrackDto>.from(decodedJsonList.map((json) => TrackDto.fromJson(json)));

      return trackList
          .map(
            (TrackDto trackDto) => TrackDto(
              title: trackDto.title,
              duration: trackDto.duration,
              preview: trackDto.preview,
              id: trackDto.id,
              artist: trackDto.artist,
            ),
          )
          .toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
