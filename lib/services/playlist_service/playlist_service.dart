import 'dart:convert';

import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/services/network_service/models/delete_request_model.dart';
import 'package:music_player/services/network_service/models/get_request_model.dart';
import 'package:music_player/services/network_service/models/post_request_model.dart';
import 'package:music_player/services/network_service/network_service.dart';
import 'package:music_player/store/playlist/playlist_actions/add_to_playlist_action.dart';
import 'package:music_player/store/playlist/playlist_actions/delete_from_playlist_action.dart';
import 'package:music_player/store/playlist/playlist_actions/get_palylist_action.dart';

class PlaylistService {
  PlaylistService._privateConstructor();

  static final PlaylistService instance = PlaylistService._privateConstructor();

  // Future<void> addToPlaylist(AddToPlaylistAction action) async {
  //   final response = await NetworkService.instance.request(PostRequestModel(
  //       url:
  //           'http://api.deezer.com/playlist/9717962062/tracks?access_token=franhx4bvAvQcw60tGoN4Th40ByYcYGPGL7hIJgH2CPhQ44Mo7K&request_method=post&songs=${action.trackId}'));
  //   if (response.error == null) {
  //     return;
  //   } else {
  //     throw Exception('Failed to add track');
  //   }


  Future<void> deleteFromPlaylist(DeleteFromPlaylistAction action) async {
    final response = await NetworkService.instance.request(DeleteRequestModel(
        url:
            'http://api.deezer.com/playlist/9717962062/tracks?access_token=franhx4bvAvQcw60tGoN4Th40ByYcYGPGL7hIJgH2CPhQ44Mo7K&request_method=delete&songs=${action.trackId}'));
    if (response.error == null) {
      return;
    } else {
      throw Exception('Failed to delete data');
    }
  }

  Future<List<TrackDto>?> getPlaylist(GetPlaylistAction action) async {
    final response = await NetworkService.instance.request(GetRequestModel(url: 'https://api.deezer.com/playlist/9717962062?access_token=franhx4bvAvQcw60tGoN4Th40ByYcYGPGL7hIJgH2CPhQ44Mo7K'));
    if (response.error == null) {
      final decodedJsonList = jsonDecode(jsonEncode(response.response).toString());
      print(decodedJsonList);
      final List<TrackDto> trackList = List<TrackDto>.from(decodedJsonList['tracks']['data'].map((json) => TrackDto.fromJson(json)));

      return trackList
          .map((TrackDto trackDto) => TrackDto(
        title: trackDto.title,
        duration: trackDto.duration,
        preview: trackDto.preview,
        trackId: trackDto.trackId,
      ))
          .toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
