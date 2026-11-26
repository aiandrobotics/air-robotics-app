import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

/// Manages the user's preferred app [Locale].
///
/// `null` means follow the device's system language (default).
class LocaleNotifier extends Notifier<Locale?> {
  static const String boxName = 'air_app_settings';
  static const String _localeKey = 'preferred_locale';

  @override
  Locale? build() {
    if (Hive.isBoxOpen(boxName)) {
      final savedCode = Hive.box<String>(boxName).get(_localeKey);
      if (savedCode != null && savedCode.isNotEmpty) {
        return Locale(savedCode);
      }
    }
    return null;
  }

  /// Sets a specific [locale], or `null` to follow the device's language.
  Future<void> setLocale(Locale? locale) async {
    state = locale;
    if (!Hive.isBoxOpen(boxName)) return;
    final box = Hive.box<String>(boxName);
    if (locale == null) {
      await box.delete(_localeKey);
    } else {
      await box.put(_localeKey, locale.languageCode);
    }
  }
}

final localeProvider = NotifierProvider<LocaleNotifier, Locale?>(
  LocaleNotifier.new,
);
