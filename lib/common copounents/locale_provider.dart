import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = Locale('en');
    notifyListeners();
  }
}

class L10n {
  static final all = [
    Locale('en'),
    Locale('ar'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'ar':
        return '🇸🇦';
      case 'en':
      default:
        return '🇺🇸';
    }
  }
}
