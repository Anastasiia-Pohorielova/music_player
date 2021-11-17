import 'package:music_player/dictionary/languages/en.dart';
import 'package:music_player/dictionary/languages/he.dart';
import 'package:music_player/dictionary/languages/ru.dart';
import 'package:flutter/material.dart';

import 'package:music_player/dictionary/models/supported_language.dart';
import 'package:music_player/res/locales.dart';

class SupportedLocales {
  late List<SupportedLanguage> _supportedLocales;

  SupportedLocales._() {
    _supportedLocales = <SupportedLanguage>[
      SupportedLanguage(
        languageCode: Locales.en,
        language: en,
      )..choose(),
      SupportedLanguage(
        languageCode: Locales.ru,
        language: ru,
      ),
      SupportedLanguage(
        languageCode: Locales.he,
        language: he,
      ),
    ];
  }

  static SupportedLocales instance = SupportedLocales._();

  void changeLocale(String languageCode) {
    _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.isSelected).discard();
    _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.languageCode == languageCode).choose();
  }

  List<Locale> get getSupportedLocales {
    return _supportedLocales.map((SupportedLanguage supLang) => supLang.getLocale).toList();
  }

  String get getCurrentLocale {
    return _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.isSelected).languageCode;
  }

  SupportedLanguage getSupportedLanguage(Locale locale) {
    return _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.languageCode == locale.languageCode);
  }

}