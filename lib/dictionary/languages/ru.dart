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

const Language ru = Language(
  bottomBarDictionary: BottomBarDictionary(
    favorites: 'Избранное',
    home: 'Дом',
    settings: 'Настройки',
  ),
  errorPopUpDictionary: ErrorPopUpDictionary(
    bug: 'На сервере произошла ошибка, подождите...',
    success: 'Успешно',
    ok: 'Ок',
    error: 'Ошибка',
  ),
  favoritesDictionary: FavoritesDictionary(
    favorites: 'Избранное',
    yourListIsEmpty: 'Ваш список пуст',
    back: 'Назад',
  ),
  forgotYourPasswordDictionary: ForgotYourPasswordDictionary(
    emailIsNotFound: 'Email не найден',
    passwordIsNotMatch: 'Пароль не совпадает',
    show: 'Показать',
    password: 'Пароль',
    email: 'Эл. адрес',
    confirmPassword: 'Подтвердите пароль',
    code: 'Код',
    enterANewPassword: 'Введите новый пароль',
    enterYourEmail: 'Введите адрес эл. почты',
    save: 'Сохранить',
    send: 'Послать',
    weHaveSentAVerificationCode: 'Мы отправили проверочный код на вашу электронную почту. Введите код',
  ),
  homeDictionary: HomeDictionary(
    delete: 'Удалить',
    chooseTheFood: 'Выбери продукты',
    clearAll: 'Очистить все',
    notFound: 'Не найден',
    watchRecipes: 'Смотреть рецепты',
  ),
  notificationDictionary: NotificationDictionary(
    notification: 'Уведомление',
    version: 'Версия',
    back: 'Назад',
  ),
  notificationPopUpDictionary: NotificationPopUpDictionary(
    aNewVersionIsAvailable: 'Доступна новая версия',
    ok: 'Ok',
  ),
  onBoardingDictionary: OnBoardingDictionary(
    firstSlide: 'Выберите продукты, которые у вас есть',
    secondSlide: 'Выбирайте все продукты и нажимайте «смотреть рецепты».',
    thirdSlide: 'Выберите рецепт из представленного списка.',
    forthSlide: 'Соблюдайте рецепт и приятного аппетита',
    next: 'Следующий',
    start: 'Начать',
  ),
  popUpFavoritesDictionary: PopUpFavoritesDictionary(
    thisRecipeWasRemoved: 'Этот рецепт удален из избранного',
    thisRecipeAdded: 'Этот рецепт добавлен в избранное',
    doYouWantToRemoveThisRecipeFromFavourite: 'Вы хотите удалить этот рецепт из избранного?',
    no: 'Нет',
    yes: 'Да',
  ),
  quitPopUpDictionary: QuitPopUpDictionary(
    yes: 'Да',
    no: 'Нет',
    question: 'Вы уверены, что хотите выйти из приложения',
  ),
  recipeDictionary: RecipeDictionary(
    foodElements: 'Ингредиенты ',
    basic: 'Базовый',
    cal: 'кал',
    cooking: 'Готовка',
    min: 'мин',
    similarRecipes: 'Похожие рецепты',
    youDoNotHave: 'У вас нет',
    youHave: 'У вас есть',
    back: 'Назад',
    bonAppetit: 'Приятного аппетита',
  ),
  recipesDictionary: RecipesDictionary(
    loading: 'загрузка...',
    recipes: 'Рецепты',
    yourListIsEmpty: 'Ваш список пуст',
    back: 'Назад',
  ),
  settingsDictionary: SettingsDictionary(
    language: 'Язык',
    settings: 'Настройки',
    aboutCompany: 'О компании',
    logOut: 'Выйти',
    notification: 'Уведомления',
    back: 'Назад',
  ),
  signInDictionary: SignInDictionary(
    valueCantBeEmpty: 'Значение не может быть пустым',
    email: 'Эл. адрес',
    password: 'Пароль',
    signInWith: 'Войти в систему с ',
    show: 'Показать',
    signIn: 'Войти',
    forgotYourPassword: 'Забыли свой пароль?',
    logIn: 'Авторизоваться',
  ),
  signUpDictionary: SignUpDictionary(
    confirmPassword: 'Подтвердите пароль',
    email: 'Эл. адрес',
    password: 'Пароль',
    registerWith: 'Зарегистрируйтесь с ',
    show: 'Показать',
    signUp: 'Зарегистрироваться',
    welcome: 'Добро пожаловать',
  ),
  swipeDictionary: SwipeDictionary(
    ok: 'Ok',
    youCanDeleteFoodBySwipe: 'Вы можете удалить еду, проведя пальцем вправо или влево',
  ),
  deletePopUpDictionary: DeletePopUpDictionary(
    doYouWantToDeleteThisRecipe: 'Вы хотите удалить этот рецепт?',
    no: 'Нет',
    yes: 'Да',
  ),
);
