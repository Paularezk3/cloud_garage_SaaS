// lib/core/services/locale_service.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LocaleService {
  Future<Locale> getDeviceLocale(List<Locale> supportedLocales) async {
    // Retrieve the device's preferred locale
    Locale? deviceLocale = PlatformDispatcher.instance.locale;

    // Check if the locale is supported
    if (supportedLocales
        .any((locale) => locale.languageCode == deviceLocale.languageCode)) {
      return deviceLocale;
    }

    return supportedLocales.first; // Default to the first locale
  }
}
