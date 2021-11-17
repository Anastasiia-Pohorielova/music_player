
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:music_player/dictionary/flutter_delegate.dart';
import 'package:music_player/dictionary/flutter_dictionary.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/const.dart';
import 'package:music_player/res/locales.dart';
import 'package:music_player/services/route_service/route_builder.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/pages/main_page/main_page.dart';
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
          return MaterialApp(
            theme: ThemeData(
              accentColor: AppColors.white,
            ),
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigatorHolder.navigatorKey,
            onGenerateRoute: RouteBuilder.onGenerateRoute,
            home: MainPage(),
            locale: Locale(Locales.base),
            supportedLocales: FlutterDictionaryDelegate.getSupportedLocales,
            localizationsDelegates: FlutterDictionaryDelegate.getLocalizationDelegates,
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}