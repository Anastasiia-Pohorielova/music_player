import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/config/app_router.gr.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/res/image_assets.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/pages/home_page/home_page_vm.dart';
import 'package:auto_route/auto_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageVM>(
      converter: HomePageVM.fromStore,
      builder: (BuildContext context, HomePageVM vm) {
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
                  padding: const EdgeInsets.only(top: 20.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: vm.playlist.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () => context.router.push(PlaylistRoute(playlistTitle: vm.playlist[index].title)),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20.0),
                                alignment: Alignment.bottomCenter,
                                color: AppColors.greenLight,
                                child: Image.asset(
                                  ImageAssets.playlist,
                                  width: 200.0,
                                  height: 150.0,
                                ),
                              ),
                              Text(
                                vm.playlist[index].title,
                                style: AppTextStyles.s24fw700White,
                              ),
                            ],
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
