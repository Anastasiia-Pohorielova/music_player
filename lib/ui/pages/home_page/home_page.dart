import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/pages/album_page/album_page_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  StoreConnector<AppState, AlbumPageVM>(
      converter: AlbumPageVM.fromStore,
      builder: (BuildContext context, AlbumPageVM vm) {
        return MainLayout(
          customAppBar: Container(),
          body: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext ctx, int index) {
                return Column(
                  children: [
                    InkWell(
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        height: 150.0,
                        width: 150.0,
                        color: AppColors.greyDark,
                        child: Image.network(vm..first.),
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
