import 'package:music_player/dictionary/dictionary_classes/bottom_bar_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/delete_pop_up_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/error_pop_up_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/favorites_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/forgot_your_password_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/home_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/notification_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/notification_pop_up_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/onboarding_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/pop_up_favorites_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/quit_pop_up_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/recipe_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/recipes_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/settings_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/sign_in_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/sign_up_dictionary.dart';
import 'package:music_player/dictionary/dictionary_classes/swipe_dictionary.dart';

class Language {
  final BottomBarDictionary bottomBarDictionary;
  final ErrorPopUpDictionary errorPopUpDictionary;
  final FavoritesDictionary favoritesDictionary;
  final ForgotYourPasswordDictionary forgotYourPasswordDictionary;
  final HomeDictionary homeDictionary;
  final NotificationDictionary notificationDictionary;
  final OnBoardingDictionary onBoardingDictionary;
  final NotificationPopUpDictionary notificationPopUpDictionary;
  final PopUpFavoritesDictionary popUpFavoritesDictionary;
  final QuitPopUpDictionary quitPopUpDictionary;
  final RecipeDictionary recipeDictionary;
  final SettingsDictionary settingsDictionary;
  final SignInDictionary signInDictionary;
  final SignUpDictionary signUpDictionary;
  final SwipeDictionary swipeDictionary;
  final RecipesDictionary recipesDictionary;
  final DeletePopUpDictionary deletePopUpDictionary;

  const Language({
    required this.bottomBarDictionary,
    required this.errorPopUpDictionary,
    required this.favoritesDictionary,
    required this.forgotYourPasswordDictionary,
    required this.homeDictionary,
    required this.notificationDictionary,
    required this.onBoardingDictionary,
    required this.notificationPopUpDictionary,
    required this.popUpFavoritesDictionary,
    required this.quitPopUpDictionary,
    required this.recipeDictionary,
    required this.settingsDictionary,
    required this.signInDictionary,
    required this.signUpDictionary,
    required this.swipeDictionary,
    required this.recipesDictionary,
    required this.deletePopUpDictionary,
  });
}
