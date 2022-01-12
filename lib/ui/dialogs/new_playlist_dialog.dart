import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/services/dialog_service/dialog_service.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/pages/player_page/player_page_vm.dart';

class NewPlaylistDialog implements IDialog {
  final TextEditingController textEditingController = TextEditingController();


  Future<void> _builder(BuildContext context) async {
    return await DialogBuilders.defaultDialogBuilder(
      widget: StoreConnector<AppState, PlayerPageVM>(
        converter: PlayerPageVM.fromStore,
        builder: (BuildContext context, PlayerPageVM vm) {
          return DialogLayout(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    child: TextField(
                      controller: textEditingController,
                      cursorColor: AppColors.white,
                      autofocus: true,
                      style: AppTextStyles.s14fw500White,
                      decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          vm.createPlaylist(textEditingController.text);
                          DialogService.instance.close();
                        },
                        child: Text('Create', style: AppTextStyles.s18fw500White,),
                      ),
                      InkWell(
                        onTap: () {
                          DialogService.instance.close();
                        },
                        child: Text('Cancel', style: AppTextStyles.s18fw500White,),
                      ),
                    ],
                  )
                ],
              ));
        },
      ),
      context: context,
    );
  }

  @override
  Future<void> show(DisplayFunction display) async => await display(_builder);
}
