import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/models/dto/chart_dto.dart';
import 'package:music_player/models/pages/album_page_data.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/playlist/playlist_actions/get_palylist_action.dart';
import 'package:music_player/store/song_store/song_actions/get_tracklist_action.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/layouts/playlist_page_layout.dart';
import 'package:music_player/ui/pages/album_page/album_page_vm.dart';

import 'package:music_player/ui/pages/album_page/alibum_app_bar.dart';

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
      onInitialBuild: (AlbumPageVM vm) { vm.getTrackList(widget.index); },
      converter: AlbumPageVM.fromStore,
      builder: (BuildContext context, AlbumPageVM vm) {
        return PlaylistPageLayout(
          goToTrackPage: vm.goToTrackPage,
          trackList: vm.trackList,
          cover: widget.album.cover,
          artist: widget.album.artist,
          playlistTitle: widget.album.title,
        );
      },
    );
  }
}
