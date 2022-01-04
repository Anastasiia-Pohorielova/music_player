import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/pages/album_page_data.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_gradient.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/playlist/playlist_actions/get_palylist_action.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/pages/player_page/player_page_vm.dart';

class PlayerPage extends StatefulWidget {
  final int id;
  final String cover;
  final String albumTitle;
  final String trackId;

  const PlayerPage({
    required this.albumTitle,
    required this.cover,
    required this.id,
    required this.trackId,
    Key? key,
  }) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  double value = 0;
  bool openPage = false;
  bool isPaused = false;

  @override
  void initState() {
    openPage = true;
    super.initState();
  }

  void playAudioNetwork(List<TrackDto> songUrl, int startIndex) async {
    await audioPlayer.open(
      Playlist(
        audios: List.generate(
          songUrl.length,
          (index) => Audio.network(
            songUrl[index].preview,
            metas: Metas(
              id: widget.trackId,
              title: songUrl[index].title,
              album: widget.albumTitle,
              image: MetasImage.network(widget.cover),
            ),
          ),
        ),
        startIndex: startIndex,
      ),
      autoStart: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PlayerPageVM>(
        converter: PlayerPageVM.fromStore,
        onInitialBuild: (PlayerPageVM vm) => playAudioNetwork(vm.albumPlaylist, widget.id),
        builder: (BuildContext context, PlayerPageVM vm) {
          return MainLayout(
            customAppBar: const SizedBox(),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
                decoration: BoxDecoration(
                  gradient: AppGradient.playerGradient,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 70.0,
                      child: InkWell(
                        onTap: () => vm.pop(),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 70.0,
                      right: 20.0,
                      child: InkWell(
                        onTap: () {
                          if (vm.playlist.where((element) => element.title == vm.albumPlaylist[widget.id].title).isNotEmpty) {
                            vm.deleteTrack(widget.trackId);
                          } else {
                            vm.addTrack(widget.trackId);
                          }
                        },
                        child: Icon(
                          vm.playlist.where((element) => element.title == vm.albumPlaylist[widget.id].title).isNotEmpty ? Icons.remove : Icons.add,
                          color: AppColors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 100.0),
                          height: 350.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(audioPlayer.getCurrentAudioImage!.path ?? widget.cover),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  audioPlayer.getCurrentAudioTitle,
                                  style: AppTextStyles.s26fw700White,
                                ),
                                Text(
                                  audioPlayer.getCurrentAudioAlbum,
                                  style: AppTextStyles.s24fw700White.copyWith(
                                    color: AppColors.greyLight,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.favorite_border,
                              color: AppColors.white,
                              size: 30.0,
                            ),
                          ],
                        ),
                        StreamBuilder<Object>(
                            stream: audioPlayer.currentPosition,
                            builder: (context, snapshot) {
                              audioPlayer.currentPosition.listen((positionValue) {
                                value = double.parse(positionValue.inSeconds.toString());
                              });
                              return SliderTheme(
                                data: SliderThemeData(
                                  trackHeight: 2.0,
                                  activeTrackColor: AppColors.white,
                                  thumbColor: AppColors.white,
                                  inactiveTrackColor: AppColors.greyLight,
                                ),
                                child: Slider(
                                  value: value,
                                  max: 30.0,
                                  onChanged: (double value) {},
                                ),
                              );
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.shuffle,
                              color: AppColors.greyLight,
                              size: 30.0,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  audioPlayer.stop();
                                  audioPlayer.previous();
                                });
                              },
                              child: const Icon(
                                Icons.skip_previous,
                                color: AppColors.white,
                                size: 50.0,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                  setState(() {
                                    audioPlayer.playOrPause();
                                    isPaused = !isPaused;
                                  });
                              },
                              child: Icon(
                                      Icons.play_circle_fill,
                                      color: AppColors.white,
                                      size: 80.0,
                                    )
                                  // : Icon(
                                  //     Icons.pause_circle_filled_outlined,
                                  //     color: AppColors.white,
                                  //     size: 80.0,
                                  //   ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  audioPlayer.next();
                                });
                              },
                              child: Icon(
                                Icons.skip_next,
                                color: AppColors.white,
                                size: 50.0,
                              ),
                            ),
                            Icon(
                              Icons.replay,
                              color: AppColors.greyLight,
                              size: 30.0,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
