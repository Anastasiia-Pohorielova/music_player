import 'package:flutter/material.dart';

import 'package:music_player/dictionary/models/language.dart';

class SupportedLanguage {

  final String languageCode;
  final Language language;
  late bool _isSelected;

  SupportedLanguage({
    required this.languageCode,
    required this.language,
  }) {
    _isSelected = false;
  }

  bool get isSelected => _isSelected;

  void choose() => _isSelected = true;

  void discard() => _isSelected = false;

  Locale get getLocale => Locale(languageCode);
}
