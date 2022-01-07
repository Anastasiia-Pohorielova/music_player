import 'package:flutter/material.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_gradient.dart';
import 'package:music_player/ui/layouts/widgets/player_widget.dart';
import 'package:music_player/ui/pages/shared/custom_bottom_bar/custom_bottom_bar.dart';

class MainLayout extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: Container(
        decoration: BoxDecoration(gradient: isPadding ? AppGradient.albumGradient : null),
        padding: isPadding
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
                child: customAppBar,
              ),
              body: Padding(
                padding: EdgeInsets.only(bottom: tracklist.isNotEmpty ? 100.0 : 50.0),
                child: body,
              ),
              resizeToAvoidBottomInset: false,
            ),
            if(tracklist.isNotEmpty) PlayerWidget(trackList: tracklist),
            if (isBottomBar) CustomBottomBar(),
          ],
        ),
      ),
    );
  }
}
