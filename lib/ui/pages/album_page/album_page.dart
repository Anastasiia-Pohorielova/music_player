import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/models/dto/chart_dto.dart';
import 'package:music_player/models/pages/album_page_data.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/playlist/playlist_actions/get_palylist_action.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
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
      onInit: (store) {
        store.dispatch(GetPlaylistAction());
      },
      onInitialBuild: (AlbumPageVM vm) => vm.getTrackList(widget.index),
      converter: AlbumPageVM.fromStore,
      builder: (BuildContext context, AlbumPageVM vm) {
        return MainLayout(
          customAppBar: Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight),
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: AlbumAppBar(
                    pop: vm.pop,
                    imageUrl: widget.album.cover,
                    expandedHeight: 300.0,
                  ),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => ListTile(
                      title: index != 0
                          ? InkWell(
                              onTap: () => vm.goToTrackPage(
                                PlayerPageData(
                                  id: index,
                                  trackId: vm.trackList[index].trackId.toString(),
                                  cover: widget.album.cover,
                                  albumTitle: widget.album.title,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vm.trackList[index].title,
                                        style: AppTextStyles.s14fw500White,
                                      ),
                                      Text(
                                        widget.album.artist,
                                        style: AppTextStyles.s14fw500White,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: AppColors.white,
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30.0),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.album.title,
                                        style: AppTextStyles.s24fw700White,
                                      ),
                                      Text(
                                        widget.album.artist,
                                        style: AppTextStyles.s14fw500White,
                                      ),
                                      Text(
                                        'Album',
                                        style: AppTextStyles.s12fw400GreyLight,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 20.0),
                                            child: Icon(
                                              Icons.favorite,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 20.0),
                                            child: Icon(
                                              Icons.arrow_circle_down_outlined,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 20.0),
                                            child: Icon(
                                              Icons.more_vert,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Positioned(
                                    left: MediaQuery.of(context).size.width - 100.0,
                                    child: Icon(
                                      Icons.play_circle_filled,
                                      size: 50.0,
                                      color: AppColors.green,
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ),
                    childCount: vm.trackList.length,
                  ),
                )
              ],
            ),
          ),
          body: SizedBox(),
        );
      },
    );
  }
}
