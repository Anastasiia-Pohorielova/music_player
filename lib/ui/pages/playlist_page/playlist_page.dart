import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/layouts/playlist_page_layout.dart';
import 'package:music_player/ui/pages/playlist_page/playlist_page_vm.dart';

class PlaylistPage extends StatefulWidget {
  final String playlistTitle;

  const PlaylistPage({
    required this.playlistTitle,
    Key? key,
  }) : super(key: key);

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {


  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PlaylistPageVM>(
        converter: PlaylistPageVM.fromStore,
        builder: (BuildContext context, PlaylistPageVM vm) {
          return PlaylistPageLayout(
            cover: vm.playlist.firstWhere((element) => element.title == widget.playlistTitle).tracks.first.coverUrl,
            artist: vm.playlist.firstWhere((element) => element.title == widget.playlistTitle).tracks.first.albumName,
            playlistTitle: widget.playlistTitle,
            trackList: vm.playlist.firstWhere((element) => element.title == widget.playlistTitle).tracks,
            goToTrackPage: vm.goToTrackPage,
          );
        });
  }
}
