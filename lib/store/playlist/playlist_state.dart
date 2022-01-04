import 'dart:collection';

import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/playlist_model.dart';
import 'package:music_player/store/playlist/playlist_actions/add_to_playlist_action.dart';
import 'package:music_player/store/playlist/playlist_actions/save_playlist_action.dart';
import 'package:music_player/store/shared/reducer.dart';

class PlaylistState {
  final List<String> tracklist;
  final List<PlaylistModel> playlists;

  const PlaylistState({required this.playlists, required this.tracklist,});

  factory PlaylistState.initial() {
    return PlaylistState(
      playlists: <PlaylistModel>[],
      tracklist: <String>[],
    );
  }

  PlaylistState copyWith({List<PlaylistModel>? playlists, List<String>? tracklist,}) {
    return PlaylistState(playlists: playlists ?? this.playlists, tracklist: tracklist ?? this.tracklist,);
  }

  PlaylistState reducer(dynamic action) {
    return Reducer<PlaylistState>(
        actions: HashMap.from({
          AddToPlaylistAction: (dynamic action) => _addTrackToPlayList(action),
        })).updateState(action, this);
  }

  PlaylistState _addTrackToPlayList(AddToPlaylistAction action) {
    var newPlaylist = PlaylistModel(createdAt: DateTime.now(), title: action.title, tracks: []);
    newPlaylist.tracks.add(action.trackId);
    playlists.add(newPlaylist);
    return copyWith(playlists: playlists);
  }
}