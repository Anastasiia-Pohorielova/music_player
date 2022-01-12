import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/models/dto/album_dto.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/layouts/playlist_page_layout.dart';
import 'package:music_player/ui/pages/album_page/album_page_vm.dart';

class AlbumPage extends StatefulWidget {
  final int index;
  final AlbumDto album;

  const AlbumPage({
    required this.index,
    required this.album,
    Key? key,
  }) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AlbumPageVM>(
      onInitialBuild: (AlbumPageVM vm) {
        vm.getTrackList(widget.index);
      },
      converter: AlbumPageVM.fromStore,
      builder: (BuildContext context, AlbumPageVM vm) {
        return PlaylistPageLayout(
          openPlayer: vm.openPlayer,
          isPlaying: vm.isPlaying,
          startPlaying: () {
            vm.startPlaying();
            },
          stopPlaying: vm.stopPlaying,
          trackList: vm.playingTrackList,
          cover: widget.album.cover,
          artist: widget.album.artist.name,
          playlistTitle: widget.album.title,
        );
      },
    );
  }
}
