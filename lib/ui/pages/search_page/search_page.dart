import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/pages/main_page/main_page_vm.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainPageVM>(
      converter: MainPageVM.fromStore,
      builder: (BuildContext context, MainPageVM vm) {
        return MainLayout(
          customAppBar: Container(
            height: 100.0,
            child: TextField(
              onChanged: (text) {
                vm.getTracksByKey(text);
              },
            ),
          ),
          body: Container(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return vm.chart.isNotEmpty ? Row(
                  children: [
                    FadeInImage(
                      placeholder: AssetImage('dfdffds'),
                      image: NetworkImage(vm.chart[index].picture),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        children: [
                          Text(
                            vm.chart[index].title,
                            style: AppTextStyles.s14fw500White,
                          ),
                          Text(
                            vm.chart[index].artist,
                            style: AppTextStyles.s12fw400GreyLight,
                          ),
                        ],
                      ),
                    ),
                  ],
                ) : SizedBox();
              },
            ),
          ),
        );
      },
    );
  }
}
