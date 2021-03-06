import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/config/app_router.gr.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/pages/main_page/widgets/custom_app_bar.dart';
import 'package:music_player/ui/pages/search_page/search_page_vm.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SearchPageVM>(
      converter: SearchPageVM.fromStore,
      onInitialBuild: (SearchPageVM vm) => vm.getAlbums('a'),
      builder: (BuildContext context, SearchPageVM vm) {
        return MainLayout(
          customAppBar: CustomAppBar(
            action: (text) => vm.getAlbums(text),
          ),
          body: Container(
            child: vm.albums.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => context.router.push(
                          AlbumRoute(
                            album: vm.albums[index],
                            index: index,
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.network(
                                vm.albums[index].cover,
                                height: 100.0,
                                width: 100.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                children: [
                                  Text(
                                    vm.albums[index].title,
                                    style: AppTextStyles.s14fw500White,
                                  ),
                                  Text(
                                    vm.albums[index].artist.name,
                                    style: AppTextStyles.s12fw400GreyLight,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const SizedBox(),
          ),
        );
      },
    );
  }
}
