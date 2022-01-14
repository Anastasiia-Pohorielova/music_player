
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:music_player/application/application.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:music_player/config/app_config.dart';

Future<void> main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  final Store<AppState> store = Store<AppState>(
    AppState.getReducer,
    initialState: AppState.initial(),
    middleware: [
      EpicMiddleware(AppState.getAppEpic),
     // NavigationMiddleware<AppState>(),
    ],
  );
 //git  configureDependencies();
  runApp(Application(store: store));
}
