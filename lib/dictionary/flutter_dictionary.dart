import 'dart:ui';

import 'package:music_player/dictionary/models/supported_locales.dart';
import 'package:music_player/res/const.dart';
import 'package:music_player/dictionary/models/language.dart';
import 'package:music_player/dictionary/flutter_delegate.dart';
import 'package:music_player/res/locales.dart';

class FlutterDictionary {
  static const String tag = '[FlutterDictionary]';
  final Locale? locale;
  late Language language;

  FlutterDictionary._privateConstructor({this.locale});

  FlutterDictionary(this.locale);

  static final FlutterDictionary _instance = FlutterDictionary._privateConstructor();

  static FlutterDictionary get instance => _instance;


  void setNewLanguage(String languageCode) {
    logger.d('$tag => setNewLanguage() => locale => $languageCode');
    FlutterDictionaryDelegate.changeLocaleWithLanguageCode(languageCode);
    language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
  }

  void setNewLanguageAndSave(String languageCode) {
    logger.d('$tag => setNewLanguageAndSave() => locale => $languageCode');
    language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
  }

  static const List<String> _rtlLanguages = <String>[
    Locales.he,
    Locales.ps,
    Locales.ur,
    Locales.ar,
    Locales.fa,
  ];

  bool get isRTL {
    return _rtlLanguages.contains(SupportedLocales.instance.getCurrentLocale);
  }
}
