import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../localization/locale_provider.dart';

/// Manages the user's preferred [ThemeMode], defaulting to [ThemeMode.system] (Device).
class ThemeModeNotifier extends Notifier<ThemeMode> {
  static const String _themeModeKey = 'preferred_theme_mode';

  @override
  ThemeMode build() {
    if (Hive.isBoxOpen(LocaleNotifier.boxName)) {
      final saved = Hive.box<String>(LocaleNotifier.boxName).get(_themeModeKey);
      switch (saved) {
        case 'light':
          return ThemeMode.light;
        case 'dark':
          return ThemeMode.dark;
        case 'system':
          return ThemeMode.system;
      }
    }
    return ThemeMode.system;
  }

  /// Sets [mode] and persists it when Hive is initialized.
  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    if (!Hive.isBoxOpen(LocaleNotifier.boxName)) return;
    final box = Hive.box<String>(LocaleNotifier.boxName);
    switch (mode) {
      case ThemeMode.system:
        await box.delete(_themeModeKey);
      case ThemeMode.light:
        await box.put(_themeModeKey, 'light');
      case ThemeMode.dark:
        await box.put(_themeModeKey, 'dark');
    }
  }
}

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);
