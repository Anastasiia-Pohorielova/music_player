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
import 'package:music_player/dictionary/models/language.dart';

const Language en = Language(
  bottomBarDictionary: BottomBarDictionary(
    favorites: 'Favorites',
    home: 'Home',
    settings: 'Settings',
  ),
  errorPopUpDictionary: ErrorPopUpDictionary(
    bug: 'There`s been a bug on the server, please wait...',
    error: 'Error',
    ok: 'Ok',
    success: 'Success',
  ),
  favoritesDictionary: FavoritesDictionary(
    favorites: 'Favorites',
    yourListIsEmpty: 'Your list is empty',
    back: 'Back',
  ),
  forgotYourPasswordDictionary: ForgotYourPasswordDictionary(
    emailIsNotFound: 'Email is not found',
    passwordIsNotMatch: 'Password is not match',
    show: 'Show',
    password: 'Password',
    email: 'Email',
    confirmPassword: 'Confirm password',
    code: 'Code',
    enterANewPassword: 'Enter a new password',
    enterYourEmail: 'Enter your email',
    save: 'Save',
    send: 'Send',
    weHaveSentAVerificationCode: 'We have sent a verification code to your email. Enter a code',
  ),
  homeDictionary: HomeDictionary(
    delete: 'Delete',
    chooseTheFood: 'Choose the food',
    clearAll: 'Clear all',
    notFound: 'Not found',
    watchRecipes: 'Watch recipes',
  ),
  notificationDictionary: NotificationDictionary(
    notification: 'Notification',
    version: 'Version',
    back: 'Back',
  ),
  notificationPopUpDictionary: NotificationPopUpDictionary(
    aNewVersionIsAvailable: 'A new version is available',
    ok: 'Ok',
  ),
  onBoardingDictionary: OnBoardingDictionary(
    firstSlide: 'Choose the products you have',
    secondSlide: 'Pick out all the groceries and click \"watch recipes\".',
    thirdSlide: 'Select a recipe from the list provided.',
    forthSlide: 'Follow the recipe and bon appetit',
    next: 'Next',
    start: 'Start',
  ),
  popUpFavoritesDictionary: PopUpFavoritesDictionary(
    thisRecipeWasRemoved: 'This recipe was removed from the favorites',
    thisRecipeAdded: 'This recipe added to favorites',
    doYouWantToRemoveThisRecipeFromFavourite: 'Do you want remove this recipe from favourite?',
    no: 'No',
    yes: 'Yes',
  ),
  quitPopUpDictionary: QuitPopUpDictionary(
    yes: 'Yes',
    no: 'No',
    question: 'Are you sure you want to quit the application?',
  ),
  recipeDictionary: RecipeDictionary(
    foodElements: 'Food elements',
    basic: 'Basic',
    cal: 'cal',
    cooking: 'Cooking',
    min: 'min',
    similarRecipes: 'Similar recipes',
    youDoNotHave: 'You don\'t have',
    youHave: 'You have',
    back: 'Back',
    bonAppetit: 'Bon Appetit',
  ),
  recipesDictionary: RecipesDictionary(
    loading: 'loading...',
    recipes: 'Recipes',
    yourListIsEmpty: 'Your list is empty',
    back: 'Back',
  ),
  settingsDictionary: SettingsDictionary(
    language: 'Language',
    settings: 'Settings',
    aboutCompany: 'About company',
    logOut: 'Log out',
    notification: 'Notification',
    back: 'Back',
  ),
  signInDictionary: SignInDictionary(
    valueCantBeEmpty: 'Value can`t be empty',
    email: 'Email',
    password: 'Password',
    signInWith: 'Sign in with ',
    show: 'Show',
    signIn: 'Sign in',
    forgotYourPassword: 'Forgot your password?',
    logIn: 'Log in',
  ),
  signUpDictionary: SignUpDictionary(
    confirmPassword: 'Confirm password',
    email: 'Email',
    password: 'Password',
    registerWith: 'Register with ',
    show: 'Show',
    signUp: 'Sign up',
    welcome: 'Welcome',
  ),
  swipeDictionary: SwipeDictionary(
    ok: 'Ok',
    youCanDeleteFoodBySwipe: 'You can delete food by swipe to the right or left',
  ),
  deletePopUpDictionary: DeletePopUpDictionary(
    doYouWantToDeleteThisRecipe: 'Do you want delete this Recipe?',
    no: 'No',
    yes: 'Yes',
  ),
);
