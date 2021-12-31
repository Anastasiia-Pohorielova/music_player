import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_gradient.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/res/image_assets.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';

import 'package:music_player/ui/pages/auth_page/auth_page_vm.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({Key? key}) : super(key: key);

  @override
  _EnterPageState createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthPageVM>(
        converter: AuthPageVM.fromStore,
        builder: (BuildContext context, AuthPageVM vm) {
        return MainLayout(
          isBottomBar: false,
          isPadding: false,
          body: Column(
            children: [
              Image.asset(
                ImageAssets.background,
                frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
                  return Container(
                    foregroundDecoration: BoxDecoration(
                      gradient: AppGradient.backgroundGradient,
                    ),
                    width: double.infinity,
                    child: child,
                  );
                },
              ),
              Icon(
                Icons.multitrack_audio,
                color: AppColors.white,
                size: 54.0,
              ),
              Center(
                child: Text(
                  'Listen free. Join community.',
                  style: AppTextStyles.s14fw500White,
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () => vm.goToRegisterPage(),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 40.0),
                    height: 45.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: AppColors.green,
                    ),
                    child: Text(
                      'Register',
                      style: AppTextStyles.s14fw500White.copyWith(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => vm.goToLoginPage(),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Log in',
                    style: AppTextStyles.s14fw500White.copyWith(fontSize: 18.0),
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
