import 'dart:ui';

import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    lineLength: 80,
  ),
);

//region [Duration]
const Duration oneSecond = Duration(seconds: 1);
const Duration threeSeconds = Duration(seconds: 3);
const Duration twoSeconds = Duration(seconds: 2);

const Duration milliseconds200 = Duration(milliseconds: 200);
const Duration milliseconds300 = Duration(milliseconds: 300);
const Duration milliseconds400 = Duration(milliseconds: 400);
const Duration milliseconds500 = Duration(milliseconds: 500);
const Duration milliseconds700 = Duration(milliseconds: 700);
const Duration milliseconds900 = Duration(milliseconds: 900);
//endregion

//region [Links]
const String wannaCreateMyCatalogLink = 'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg';
const String createByLink = 'https://appvesto.com/';
//endregion

//region [Main strings]
const String title = 'My catalog';
const String exampleID = '1234';
const String emptyString = '';
const String emptyFridge = 'Empty Fridge';
const String questionMark = '?';
const String google = 'Google';
const String apple = 'Apple';
const String one = '1';
const String token = 'token';
const String expiredTime = 'expiredTime';
const String pattern =
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r'{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]'
    r'{0,253}[a-zA-Z0-9])?)*$';
final RegExp regExpUpperLiteral = RegExp(r'^(?=.*?[A-Z])');
final RegExp regExpDownLiteral = RegExp(r'^(?=.*?[a-z])');
final RegExp regExpNumeric = RegExp(r'^(?=.*?[0-9])');
final RegExp regExpAtSign = RegExp(r'^(?=.*?[@])');
final RegExp regExpEightLong = RegExp(r'^.{8,}$');

//endregion

//region [PLACEHOLDER TEXT]
const String placeholderTextShort =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';
const String placeholderText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
//endregion

//region [ScreenUtils]
const bool designScreenAllowFontScaling = true;
const double designScreenHeight = 812.0;
const double designScreenWidth = 375.0;
const double minTabletWidth = 600.0;
//endregion

//region [Keys]
const String keyName = 'name';
const String keyDescription = 'description';
const String keyDescription2 = 'description2';
const String keyPoints = 'points';
const String keyTitle = 'title';
const String applicationKey = 'Application';
//endregion

//region [Errors]
const String error = 'Error!';
//endregion

class Sizes {
  static const Size sizeMinimumConfettiTriangle = Size(9.0, 9.0);
  static const Size sizeMaximumConfettiTriangle = Size(14.0, 14.0);
  static const Size sizeMinimumConfettiCircle = Size(2.0, 2.0);
  static const Size sizeMaximumConfettiCircle = Size(4.0, 4.0);
}

class ResponseKeys {
  static const String data = 'data';
  static const String confetti = 'confetti';
}

class PageTypes {
  static const String homeType = 'HOME';
  static const String settingsType = 'settings';
  static const String notificationType = 'notification';
  static const String recipeType = 'recipe';
  static const String recipesType = 'recipes';
  static const String favoritesType = 'favorites';
  static const String switchType = 'SWITCH';
  static const String signoutType = 'SIGNOUT';
  static const String anotherCatalog = 'ANOTHER_CATALOG';
}

class FileTypes {
  static const imageType = 'IMAGE';
  static const videoType = 'VIDEO';
  static const pdfType = 'PDF';
}
