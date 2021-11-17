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

const Language he = Language(
  bottomBarDictionary: BottomBarDictionary(
    favorites: 'מועדפים',
    home: 'בית',
    settings: 'הגדרות',
  ),
  errorPopUpDictionary: ErrorPopUpDictionary(
    bug: 'היה באג בשרת, אנא המתן ...',
    error: 'שְׁגִיאָה',
    ok: 'בסדר',
    success: 'הַצלָחָה',
  ),
  favoritesDictionary: FavoritesDictionary(
    favorites: 'מועדפים',
    yourListIsEmpty: 'הרשימה שלך ריקה',
    back: 'חזור',
  ),
  forgotYourPasswordDictionary: ForgotYourPasswordDictionary(
    emailIsNotFound: 'אימייל לא נמצא',
    passwordIsNotMatch: 'הסיסמה אינה תואמת',
    show: 'הופעה',
    password: 'סיסמה',
    email: 'אימייל',
    confirmPassword: 'אשר סיסמה',
    code: 'קוד',
    enterANewPassword: 'הכנס סיסמא חדשה',
    enterYourEmail: 'הכנס את האימייל שלך',
    save: 'להציל',
    send: 'לִשְׁלוֹחַ',
    weHaveSentAVerificationCode: 'שלחנו קוד אימות לדוא"ל שלך. הזן קוד',
  ),
  homeDictionary: HomeDictionary(
    delete: 'לִמְחוֹק',
    chooseTheFood: 'בחר את האוכל',
    clearAll: 'נקה הכל',
    notFound: 'לא נמצא',
    watchRecipes: 'צפו במתכונים',
  ),
  notificationDictionary: NotificationDictionary(
    notification: 'הוֹדָעָה',
    version: 'גִרְסָה',
    back: 'חזור',
  ),
  notificationPopUpDictionary: NotificationPopUpDictionary(
    aNewVersionIsAvailable: 'קיימת גרסה חדשה',
    ok: 'בסדר',
  ),
  onBoardingDictionary: OnBoardingDictionary(
    firstSlide: 'בחר את המוצרים שיש לך',
    secondSlide: 'בחר את כל המרכיבים ולחץ על "\הצג מתכונים"\.',
    thirdSlide: 'בחר מתכון מהרשימה המופיעה.',
    forthSlide: 'עקוב אחר המתכון ובתאבון',
    next: 'הַבָּא',
    start: 'הַתחָלָה',
  ),
  popUpFavoritesDictionary: PopUpFavoritesDictionary(
    thisRecipeWasRemoved: 'מתכון זה הוסר מהמועדפים',
    thisRecipeAdded: 'המתכון הזה נוסף למועדפים',
    yes: 'כן',
    no: 'לא',
    doYouWantToRemoveThisRecipeFromFavourite: 'האם אתה רוצה להסיר את המתכון הזה מהמועדף?',
  ),
  quitPopUpDictionary: QuitPopUpDictionary(
    yes: 'כן',
    no: 'לא',
    question: 'האם אתה בטוח שברצונך לסגור את היישום',
  ),
  recipeDictionary: RecipeDictionary(
    foodElements: 'רכיבי מזון',
    basic: 'בסיסי',
    cal: 'קלוריות',
    cooking: 'בישול',
    min: 'דקות',
    similarRecipes: 'מתכונים דומים',
    youDoNotHave: 'אין לך',
    youHave: 'יש לך',
    back: 'חזור',
    bonAppetit: 'בתאבון',
  ),
  recipesDictionary: RecipesDictionary(
    loading: 'טוען...',
    recipes: 'מתכונים',
    yourListIsEmpty: 'הרשימה שלך ריקה',
    back: 'חזור',
  ),
  settingsDictionary: SettingsDictionary(
    language: 'שפה',
    settings: 'הגדרות',
    aboutCompany: 'אודות חברה',
    logOut: 'להתנתק',
    notification: 'הוֹדָעָה',
    back: 'חזור',
  ),
  signInDictionary: SignInDictionary(
    valueCantBeEmpty: 'הערך לא יכול להיות ריק',
    email: 'אימייל',
    password: 'סיסמה',
    signInWith: ' להתחבר עם ',
    show: 'הופעה',
    signIn: 'להתחבר',
    forgotYourPassword: 'שכחת ססמה?',
    logIn: 'התחברות',
  ),
  signUpDictionary: SignUpDictionary(
    confirmPassword: 'אשר סיסמה',
    email: 'אימייל',
    password: 'סיסמה',
    registerWith: 'הירשם עם ',
    show: 'הופעה',
    signUp: 'הירשם',
    welcome: 'ברוך הבא',
  ),
  swipeDictionary: SwipeDictionary(
    ok: 'בסדר',
    youCanDeleteFoodBySwipe: 'אתה יכול למחוק מזון על ידי החלקה ימינה או שמאלה',
  ),
  deletePopUpDictionary: DeletePopUpDictionary(
    doYouWantToDeleteThisRecipe: 'האם אתה רוצה למחוק את המתכון הזה?',
    no: 'לא',
    yes: 'כן',
  ),
);
