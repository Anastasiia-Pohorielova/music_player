import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/config/app_router.dart';
import 'package:music_player/config/app_router.gr.dart';
import 'package:music_player/dictionary/flutter_delegate.dart';
import 'package:music_player/dictionary/flutter_dictionary.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/const.dart';
import 'package:music_player/res/locales.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:redux/redux.dart';

class Application extends StatefulWidget {
  final Store<AppState> store;

  Application({required this.store}) : super(key: Key(applicationKey));

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  @override
  void initState() {
    FlutterDictionary.instance.setNewLanguageAndSave(Locales.en);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) => store.state,
        builder: (BuildContext context, AppState state) {
          return MaterialApp.router(
            theme: ThemeData(
              accentColor: AppColors.white,
            ),
            debugShowCheckedModeBanner: false,
            locale: Locale(Locales.base),
            supportedLocales: FlutterDictionaryDelegate.getSupportedLocales,
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
