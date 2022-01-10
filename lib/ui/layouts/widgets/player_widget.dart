import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';

class PlayerWidget extends StatefulWidget {
  final AssetsAudioPlayer audioPlayer;

  const PlayerWidget({
    required this.audioPlayer,
    Key? key,
  }) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  double currentPosition = 10.0;

  @override
  void initState() {
    widget.audioPlayer.onReadyToPlay.listen((event) {
      setState(() {});
    });
    super.initState();
  }
   @override
  void dispose() {
    widget.audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.audioPlayer.getCurrentAudioImage == null
        ? Center(
            child: CircularProgressIndicator(
              color: AppColors.white,
            ),
          )
        : GestureDetector(
          onTap: () {
            setState(() {
              currentPosition = 10.0;
            }); },
          onHorizontalDragUpdate: (position) {
            setState(() {
                currentPosition -= position.delta.dx;
                if(currentPosition > 150.0) {
                  setState(() {
                    widget.audioPlayer.stop();
                  });
                }
            });
          },
          child: Container(
              height: 60.0,
              margin: const EdgeInsets.only(bottom: 50.0),
              width: MediaQuery.of(context).size.width-40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.greyDark.withOpacity(0.9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 15.0),
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(image: NetworkImage(widget.audioPlayer.getCurrentAudioImage!.path)),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.audioPlayer.getCurrentAudioTitle,
                          style: AppTextStyles.s18fw500White,
                        ),
                        Text(
                          widget.audioPlayer.getCurrentAudioArtist,
                          style: AppTextStyles.s14fw500White,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.audioPlayer.isPlaying.valueWrapper!.value == true ? widget.audioPlayer.pause() : widget.audioPlayer.play();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        widget.audioPlayer.isPlaying.valueWrapper!.value == true ? Icons.pause : Icons.play_arrow,
                        color: AppColors.white,
                        size: 40.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        );
  }
}
