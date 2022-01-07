import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/services/dialog_service/dialog_service.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/dialogs/new_playlist_dialog.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/pages/add_to_playlist_page/add_to_playlist_page_vm.dart';
import 'package:music_player/ui/pages/shared/custom_button.dart';

class AddToPlaylistPage extends StatefulWidget {
  final TrackModel newTrack;

  const AddToPlaylistPage({
    required this.newTrack,
    Key? key,
  }) : super(key: key);

  @override
  _AddToPlaylistPageState createState() => _AddToPlaylistPageState();
}

class _AddToPlaylistPageState extends State<AddToPlaylistPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AddToPlaylistPageVM>(
      converter: AddToPlaylistPageVM.fromStore,
      builder: (BuildContext context, AddToPlaylistPageVM vm) {
        return MainLayout(
          customAppBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => vm.pop(),
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 24.0,
                ),
              ),
              Text(
                'Add to playlist',
                style: AppTextStyles.s14fw500White,
              ),
              const SizedBox(
                width: 24.0,
              ),
            ],
          ),
          body: Column(
            children: [
              CustomButton(
                onTap: () {
                  DialogService.instance.show(NewPlaylistDialog());
                },
                title: 'Create new playlist',
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: vm.playlist.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return InkWell(
                        onTap: () {
                          vm.addTrack(widget.newTrack, vm.playlist[index].title);
                          vm.pop();
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 80.0,
                              width: 80.0,
                              margin: const EdgeInsets.all(20.0),
                              color: AppColors.green,
                              alignment: Alignment.center,
                              child: Text('P'),
                            ),
                            Text(
                              vm.playlist[index].title,
                              style: AppTextStyles.s18fw500White,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
