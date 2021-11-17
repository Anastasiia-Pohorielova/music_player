// import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
// import 'package:music_player/models/pages/interfaces/i_page_data.dart';
// import 'package:music_player/services/route_service/res/routes.dart';
// import 'package:music_player/services/route_service/route_manager.dart';
// import 'package:music_player/store/application/app_state.dart';
// import 'package:redux/redux.dart';
//
// class RouteSelectors {
//   static bool get canPop => RouteManager.instance.canPop;
//
//   static NavigateToAction? get pop => RouteManager.instance.pop();
//
//   static NavigateToAction? get goToSplashScreenAction => RouteManager.instance.push(Routes.splashScreen);
//
//   static NavigateToAction? get goToHomePageAction => RouteManager.instance.push(Routes.mainPage);
//
//   static NavigateToAction? get replaceAndGoToHomeAction => RouteManager.instance.replace(Routes.mainPage);
//
//   static NavigateToAction? get goToSettingsPageAction => RouteManager.instance.push(Routes.settingsPage);
//
//   static NavigateToAction? get replaceToSettingsPageAction => RouteManager.instance.replace(Routes.settingsPage);
//
//   static NavigateToAction? get goToFavoritePageAction => RouteManager.instance.push(Routes.favoritePage);
//
//   static NavigateToAction? get replaceToFavoritePageAction => RouteManager.instance.replace(Routes.favoritePage);
//
//   static NavigateToAction? goToRecipePageAction(IPageData data) => RouteManager.instance.push(Routes.recipePage, data);
//
//   static NavigateToAction? goToSimilarRecipePageAction(IPageData data) => RouteManager.instance.replace(Routes.recipePage, data);
//
//   static NavigateToAction? get goToRecipesPageAction => RouteManager.instance.push(Routes.foundRecipesPage);
//
//   static NavigateToAction? get goToNotificationPageAction => RouteManager.instance.push(Routes.notificationPage);
//
//   static NavigateToAction? get goToAuthPageAction => RouteManager.instance.push(Routes.authPage);
//
//   static String? get getCurrentPage => RouteManager.instance.currentRoute;
//
//   static void Function() doPop(Store<AppState> store) {
//     if (canPop) {
//       return () => store.dispatch(pop);
//     } else {
//       return () => store.dispatch(goToHomePageAction);
//     }
//   }
//
//   static void Function() goToSplashScreen(Store<AppState> store) {
//     return () => store.dispatch(goToSplashScreenAction);
//   }
//
//   static void Function() goToHomePage(Store<AppState> store) {
//     return () => store.dispatch(goToHomePageAction);
//   }
//
//   static void Function() replaceAndGoToHomePage(Store<AppState> store) {
//     return () => store.dispatch(replaceAndGoToHomeAction);
//   }
//
//   static void Function() goToSettingsPage(Store<AppState> store) {
//     return () => store.dispatch(goToSettingsPageAction);
//   }
//
//   static void Function() replaceToSettingsPage(Store<AppState> store) {
//     return () => store.dispatch(replaceToSettingsPageAction);
//   }
//
//   static void Function() goToFavoritePage(Store<AppState> store) {
//     return () => store.dispatch(goToFavoritePageAction);
//   }
//
//   static void Function() replaceToFavoritePage(Store<AppState> store) {
//     return () => store.dispatch(replaceToFavoritePageAction);
//   }
//
//   static void Function(IPageData) goToRecipePage(Store<AppState> store) {
//     if (getCurrentPage == Routes.recipePage) {
//       return (data) => store.dispatch(goToSimilarRecipePageAction(data));
//     } else {
//       return (data) => store.dispatch(goToRecipePageAction(data));
//     }
//   }
//
//   static void Function() goToRecipesPage(Store<AppState> store) {
//     return () => store.dispatch(goToRecipesPageAction);
//   }
//
//   static void Function() goToNotificationPage(Store<AppState> store) {
//     return () => store.dispatch(goToNotificationPageAction);
//   }
//
//   static void Function() goToAuthPage(Store<AppState> store) {
//     return () => store.dispatch(goToAuthPageAction);
//   }
// }
