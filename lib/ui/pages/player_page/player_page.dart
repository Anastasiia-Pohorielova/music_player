import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/config/app_router.gr.dart';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/pages/player_page/player_page_vm.dart';

class PlayerPage extends StatefulWidget {
  final int id;
  final String cover;
  final String albumTitle;
  final String trackId;
  final String artistName;

  const PlayerPage({
    required this.albumTitle,
    required this.cover,
    required this.id,
    required this.trackId,
    required this.artistName,
    Key? key,
  }) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  double value = 0;
  bool openPage = false;
  bool result = false;

  @override
  void initState() {
    print(widget.id);
    openPage = true;
    audioPlayer.onReadyToPlay.listen((event) {
      if (!mounted) {
        return;
      }
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

  Future<void> playAudioNetwork(List<TrackModel> songUrl) async {
    await audioPlayer.open(
      Playlist(
        audios: List.generate(songUrl.length, (index) {
          return Audio.network(
            songUrl[index].trackDto.preview,
            metas: Metas(
              id: widget.trackId,
              title: songUrl[index].trackDto.title,
              album: widget.albumTitle,
              image: MetasImage.network(widget.cover),
            ),
          );
        }),
        startIndex: widget.id,
      ),
      loopMode: LoopMode.playlist,
      autoStart: false,
    );
    openPage = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PlayerPageVM>(
        converter: PlayerPageVM.fromStore,
        onInitialBuild: (PlayerPageVM vm) {
          playAudioNetwork(vm.playingTracklist);
        },
        builder: (BuildContext context, PlayerPageVM vm) {
          return MainLayout(
            body: !openPage
                ? SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 50.0),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20.0,
                            child: InkWell(
                              onTap: () => context.router.pop(),
                              child: Icon(
                                Icons.arrow_back,
                                color: AppColors.white,
                                size: 20.0,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20.0,
                            right: 20.0,
                            child: InkWell(
                              onTap: () {
                                for (var playlist in vm.playlist) {
                                  result = playlist.tracks
                                      .where((element) =>
                                          element.trackDto.id == vm.albumPlaylist[audioPlayer.current.valueWrapper!.value!.index].trackDto.id)
                                      .isNotEmpty;
                                }
                                if (result) {
                                  //  vm.deleteTrack(int.parse(widget.trackId));
                                  print('i am here');
                                } else {
                                  print(vm.albumPlaylist[audioPlayer.current.valueWrapper!.value!.index].trackDto.title);
                                  context.router.push(
                                    AddToPlaylistRoute(
                                      newTrack: TrackModel(
                                        trackDto: TrackDto(
                                          title: vm.albumPlaylist[audioPlayer.current.valueWrapper!.value!.index].trackDto.title,
                                          duration: vm.albumPlaylist[audioPlayer.current.valueWrapper!.value!.index].trackDto.duration,
                                          preview: vm.albumPlaylist[audioPlayer.current.valueWrapper!.value!.index].trackDto.preview,
                                          id: vm.albumPlaylist[audioPlayer.current.valueWrapper!.value!.index].trackDto.id,
                                          artist: vm.albumPlaylist[audioPlayer.current.valueWrapper!.value!.index].trackDto.artist,
                                        ),
                                        albumName: vm.albumPlaylist[audioPlayer.current.valueWrapper!.value!.index].albumName,
                                        coverUrl: vm.albumPlaylist[audioPlayer.current.valueWrapper!.value!.index].coverUrl,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Icon(
                                //     vm.playlist.where((element) => element.title == vm.albumPlaylist[widget.id].title).isNotEmpty ? Icons.remove
                                Icons.add,
                                color: AppColors.white,
                                size: 20.0,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 70.0),
                                height: 350.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(audioPlayer.getCurrentAudioImage!.path),
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
                                  InkWell(
                                    onTap: () => audioPlayer.toggleShuffle(),
                                    child: Icon(
                                      Icons.shuffle,
                                      color: AppColors.greyLight,
                                      size: 30.0,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      audioPlayer.previous();
                                      if (audioPlayer.loopMode.valueWrapper!.value == LoopMode.single) {
                                        audioPlayer.setLoopMode(LoopMode.playlist);
                                      }
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
                                      });
                                    },
                                    child: audioPlayer.isPlaying.valueWrapper!.value == false
                                        ? Icon(
                                            Icons.play_circle_fill,
                                            color: AppColors.white,
                                            size: 80.0,
                                          )
                                        : Icon(
                                            Icons.pause_circle_filled_outlined,
                                            color: AppColors.white,
                                            size: 80.0,
                                          ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (audioPlayer.loopMode.valueWrapper!.value == LoopMode.single) {
                                        audioPlayer.setLoopMode(LoopMode.playlist);
                                        print(audioPlayer.loopMode.valueWrapper!.value);
                                        print('true');
                                      }
                                      audioPlayer.next();
                                    },
                                    child: Icon(
                                      Icons.skip_next,
                                      color: AppColors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => audioPlayer.setLoopMode(LoopMode.single),
                                    child: Icon(
                                      Icons.replay,
                                      color: AppColors.greyLight,
                                      size: 30.0,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: AppColors.greyDark,
                    ),
                  ),
          );
        });
  }
}
