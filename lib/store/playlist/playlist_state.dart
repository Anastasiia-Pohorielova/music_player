import 'dart:collection';

import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/store/playlist/playlist_actions/save_playlist_action.dart';
import 'package:music_player/store/shared/reducer.dart';

class PlaylistState {
  final List<TrackDto> playlist;
  const PlaylistState({required this.playlist});

  factory PlaylistState.initial() {
    return PlaylistState(
      playlist: <TrackDto>[],
    );
  }

  PlaylistState copyWith({List<TrackDto>? playlist}) {
    return PlaylistState(playlist: playlist ?? this.playlist);
}

  PlaylistState reducer(dynamic action) {
    return Reducer<PlaylistState>(
        actions: HashMap.from({
          SavePlaylistAction: (dynamic action) => _savePlaylist(action),
        })).updateState(action, this);
  }

  PlaylistState _savePlaylist(SavePlaylistAction action) {
    return copyWith(playlist: action.playlist);
  }
}