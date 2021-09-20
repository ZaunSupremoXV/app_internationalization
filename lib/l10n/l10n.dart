import 'dart:ui';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

class L10n {
  static final all = [
    Locale('pt'),
    Locale('en'),
    Locale('es'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      case 'pt':
      default:
        return 'Português';
    }
  }
}
