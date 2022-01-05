import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/models/pages/album_page_data.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/pages/player_page/player_page_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PlayerPageVM>(
      converter: PlayerPageVM.fromStore,
      builder: (BuildContext context, PlayerPageVM vm) {
        return MainLayout(
          customAppBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hello',
                style: AppTextStyles.s24fw700White,
              ),
              Icon(
                Icons.settings,
                color: AppColors.white,
              ),
            ],
          ),
          body: vm.playlist.isEmpty
              ? Center(
                  child: Text(
                    'You don`t have created playlists',
                    style: AppTextStyles.s26fw700White,
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vm.playlist.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () => vm.goToPlaylistPage(PlaylistPageData(title: vm.playlist[index].title)),
                          child: Container(
                            margin: const EdgeInsets.all(20.0),
                            height: 150.0,
                            width: 150.0,
                            color: AppColors.greyDark,
                            child: Text(vm.playlist[index].title),
                          ),
                        ),
                      ],
                    );
                  }),
        );
      },
    );
  }
}
