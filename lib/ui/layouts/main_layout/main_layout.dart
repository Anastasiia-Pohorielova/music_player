import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_gradient.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/layouts/widgets/player_widget.dart';
import 'package:music_player/ui/pages/album_page/album_page_vm.dart';
import 'package:music_player/ui/pages/shared/custom_bottom_bar/custom_bottom_bar.dart';

class MainLayout extends StatefulWidget {
  final Widget customAppBar;
  final Widget body;
  final bool isBottomBar;
  final bool isPadding;
  final List<TrackModel> tracklist;

  const MainLayout({
    required this.body,
    this.isBottomBar = true,
    this.isPadding = true,
    this.customAppBar = const SizedBox(),
    this.tracklist = const [],
    Key? key,
  }) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {


  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AlbumPageVM>(
      converter: AlbumPageVM.fromStore,
      builder: (BuildContext context, AlbumPageVM vm) {
    return Material(
      color: AppColors.transparent,
      child: Container(
        decoration: BoxDecoration(gradient: widget.isPadding ? AppGradient.albumGradient : null),
        padding: widget.isPadding
            ? EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: 10.0,
                right: 10.0,
              )
            : EdgeInsets.zero,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Scaffold(
              backgroundColor: AppColors.transparent,
              appBar: PreferredSize(
                preferredSize: Size(0.0, 30.0),
                child: widget.customAppBar,
              ),
              bottomNavigationBar: vm.isPlaying ? PlayerWidget(audioPlayer: vm.audioPlayer,) : const SizedBox(),
              body: Padding(
                padding: EdgeInsets.only(bottom: vm.isPlaying ? 0.0 : 50.0),
                child: widget.body,
              ),
              resizeToAvoidBottomInset: false,
            ),
         //   if(vm.isPlaying) PlayerWidget(trackList: vm.playingTrackList),
            if (widget.isBottomBar) CustomBottomBar(),
          ],
        ),
      ),
    );
  },
);
  }
}
