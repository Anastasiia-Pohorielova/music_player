import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';

class PlayerWidget extends StatefulWidget {
  final List<TrackModel> trackList;

  const PlayerWidget({
    required this.trackList,
    Key? key,
  }) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  final List<StreamSubscription> _subscriptions = [];
  bool isPlaying = false;
  double currentPosition = 10.0;

  @override
  void initState() {
    playAudioNetwork(widget.trackList, 0);
    audioPlayer.onReadyToPlay.listen((event) {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playAudioNetwork(List<TrackModel> songUrl, int startIndex) async {
    await audioPlayer.open(
      Playlist(
        audios: List.generate(songUrl.length, (index) {
          print(songUrl[index].coverUrl);
          return Audio.network(
            songUrl[index].trackDto.preview,
            metas: Metas(
              id: songUrl[index].trackDto.id.toString(),
              title: songUrl[index].trackDto.title,
              album: songUrl[index].albumName,
              image: MetasImage.network(songUrl[index].coverUrl),
              artist: songUrl[index].trackDto.artist.name,
            ),
          );
        }),
        startIndex: startIndex,
      ),
      autoStart: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return audioPlayer.getCurrentAudioImage == null
        ? Center(
            child: CircularProgressIndicator(
              color: AppColors.greyDark,
            ),
          )
        : Positioned(
      right: currentPosition,
          bottom: 50.0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentPosition = 10.0;
              }); },
            onHorizontalDragUpdate: (position) {
              setState(() {
                  currentPosition -= position.delta.dx;
                  if(currentPosition > 150.0) {
                    dispose();
                    setState(() {

                    });
                  }
              });
            },
            child: Container(
                height: 60.0,
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
                        image: DecorationImage(image: NetworkImage(audioPlayer.getCurrentAudioImage!.path)),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            audioPlayer.getCurrentAudioTitle,
                            style: AppTextStyles.s18fw500White,
                          ),
                          Text(
                            audioPlayer.getCurrentAudioArtist,
                            style: AppTextStyles.s14fw500White,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {setState(() {
                        audioPlayer.isPlaying.valueWrapper!.value == true ? audioPlayer.pause() : audioPlayer.play();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          audioPlayer.isPlaying.valueWrapper!.value == true ? Icons.pause : Icons.play_arrow,
                          color: AppColors.white,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
        );
  }
}
