import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/pages/interfaces/i_page_data.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/services/route_service/res/routes.dart';
import 'package:music_player/services/route_service/route_manager.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:redux/redux.dart';

class RouteSelectors {
  static bool get canPop => RouteManager.instance.canPop;

  static NavigateToAction? get pop => RouteManager.instance.pop();

  static NavigateToAction? get goToSplashScreenAction => RouteManager.instance.push(Routes.splashScreen);

  static NavigateToAction? get goToHomePageAction => RouteManager.instance.push(Routes.homePage);

  static NavigateToAction? get goToRegisterPageAction => RouteManager.instance.push(Routes.registerPage);

  static NavigateToAction? get goToLoginPageAction => RouteManager.instance.push(Routes.loginPage);

  static NavigateToAction? get goToSearchPageAction => RouteManager.instance.push(Routes.searchPage);

  static NavigateToAction? goToAddToPlaylistPageAction(TrackModel trackData) => RouteManager.instance.push(Routes.addToPlaylistPage, trackData);

  static NavigateToAction? goToPlayListPageAction(IPageData data) => RouteManager.instance.push(Routes.playlistPage, data);

  static NavigateToAction? get replaceAndGoToSearchPageAction => RouteManager.instance.replace(Routes.searchPage);

  static NavigateToAction? get replaceAndGoToHomeAction => RouteManager.instance.replace(Routes.mainPage);

  static NavigateToAction? goToAlbumPageAction(IPageData data) => RouteManager.instance.push(Routes.albumPage, data);

  static NavigateToAction? goToTrackPageAction(IPageData data) => RouteManager.instance.push(Routes.trackPage, data);


  static String? get getCurrentPage => RouteManager.instance.currentRoute;

  static void Function() doPop(Store<AppState> store) {
    if (canPop) {
      return () => store.dispatch(pop);
    } else {
      return () => store.dispatch(goToHomePageAction);
    }
  }

  static void Function() goToSplashScreen(Store<AppState> store) {
    return () => store.dispatch(goToSplashScreenAction);
  }

  static void Function() goToRegisterScreen(Store<AppState> store) {
    return () => store.dispatch(goToRegisterPageAction);
  }

  static void Function() goToLoginScreen(Store<AppState> store) {
    return () => store.dispatch(goToLoginPageAction);
  }

  static void Function(TrackModel) goToAddToPlaylistScreen(Store<AppState> store) {
    return (data) => store.dispatch(goToAddToPlaylistPageAction(data));
  }

  static void Function() goToHomePage(Store<AppState> store) {
    return () => store.dispatch(goToHomePageAction);
  }

  static void Function() replaceAndGoToHomePage(Store<AppState> store) {
    return () => store.dispatch(replaceAndGoToHomeAction);
  }

  static void Function() replaceAndGoToSearchPage(Store<AppState> store) {
    return () => store.dispatch(replaceAndGoToSearchPageAction);
  }

  static void Function(IPageData) goToAlbumPage(Store<AppState> store) {
    return (data) => store.dispatch(goToAlbumPageAction(data));
  }

  static void Function(IPageData) goToPlaylistPage(Store<AppState> store) {
    return (data) => store.dispatch(goToPlayListPageAction(data));
  }

  static void Function(IPageData) goToTrackPage(Store<AppState> store) {
    return (data) => store.dispatch(goToTrackPageAction(data));
  }

  static void Function() goToSearchPage(Store<AppState> store) {
    return () => store.dispatch(goToSearchPageAction);
  }
}
