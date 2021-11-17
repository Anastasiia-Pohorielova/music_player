
import 'package:music_player/services/route_service/res/routes.dart';
import 'package:music_player/ui/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';

class RouteBuilder {
  static const String TAG = '[RouteBuilder]';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainPage:
        return _defaultRoute(
          page: MainPage(),
          settings: settings,
        );
      default:
        return _defaultRoute(
          settings: settings,
          page: MainPage(),
        );
    }
  }

  static PageRoute _defaultRoute({
    required RouteSettings settings,
    required Widget page,
  }) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page,
    );
  }
}
