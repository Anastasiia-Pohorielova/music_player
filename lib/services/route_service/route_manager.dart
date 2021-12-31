import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:music_player/models/pages/interfaces/i_page_data.dart';
import 'package:logger/logger.dart';

class RouteManager {
  Logger get logger => Logger();

  RouteManager._privateConstructor();

  static final RouteManager _instance = RouteManager._privateConstructor();

  static RouteManager get instance => _instance;

  final List<String> _history = [];

  int get routesCount => _history.length;

  String? get currentRoute => _history.isNotEmpty ? _history.last : null;

  List<String>? get historyList => _history.isNotEmpty ? _history : null;

  bool get canPop => NavigatorHolder.navigatorKey.currentState!.canPop() && _history.length >= 1;

  NavigateToAction? pop() {
    if (_history.isEmpty) return null;
    _history.removeLast();
    return NavigateToAction.pop();
  }

  NavigateToAction? push(String route, [IPageData? data]) {
    if (_history.isNotEmpty && _history.last == route && data == null) return null;
    _history.add(route);
    return NavigateToAction.push(route, arguments: data);
  }

  NavigateToAction? pushAndRemoveUntil(String route) {
    if (_history.isNotEmpty && _history.last == route) return null;
    _history.clear();
    _history.add(route);
    return NavigateToAction.pushNamedAndRemoveUntil(route, (route) => false);
  }

  NavigateToAction? replace(String route, [IPageData? data]) {
    if (_history.isNotEmpty && _history.last == route && data == null) return null;
    if (_history.isNotEmpty) _history.removeLast();
    _history.add(route);
    return NavigateToAction.replace(route, arguments: data);
  }
}
