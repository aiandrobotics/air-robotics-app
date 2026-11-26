import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/localization/locale_provider.dart';
import '../core/localization/supported_languages.dart';
import '../core/theme/app_tokens.dart';
import '../core/theme/theme_mode_provider.dart';
import '../l10n/app_localizations.dart';
import 'language_settings_screen.dart';

/// App settings page structured as an extensible list of settings items.
class SettingsScreen extends ConsumerWidget {
  static const String appVersionLabel = '1.0.0 (Build 1)';

  const SettingsScreen({super.key});

  String _themeLabel(AppLocalizations? l10n, ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return l10n?.themeSystem ?? 'Device';
      case ThemeMode.light:
        return l10n?.themeLight ?? 'Light';
      case ThemeMode.dark:
        return l10n?.themeDark ?? 'Dark';
    }
  }

  Future<void> _showThemeDialog(
    BuildContext context,
    WidgetRef ref,
    ThemeMode currentMode,
  ) async {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final options = <(ThemeMode, String, IconData)>[
      (ThemeMode.system, l10n?.themeSystem ?? 'Device', Icons.brightness_auto),
      (ThemeMode.light, l10n?.themeLight ?? 'Light', Icons.light_mode_outlined),
      (ThemeMode.dark, l10n?.themeDark ?? 'Dark', Icons.dark_mode_outlined),
    ];

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n?.themeTitle ?? 'Theme'),
        contentPadding: const EdgeInsets.symmetric(vertical: AppTokens.space8),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final (mode, label, icon) in options)
              ListTile(
                leading: Icon(
                  icon,
                  color: mode == currentMode ? colorScheme.primary : null,
                ),
                title: Text(label),
                trailing: mode == currentMode
                    ? Icon(Icons.check_circle, color: colorScheme.primary)
                    : null,
                onTap: () {
                  ref.read(themeModeProvider.notifier).setThemeMode(mode);
                  Navigator.of(dialogContext).pop();
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final selectedLocale = ref.watch(localeProvider);
    final selectedThemeMode = ref.watch(themeModeProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final systemLabel =
        l10n?.languageSystemDefault ?? 'System Default (Device Language)';
    final currentLanguageLabel = SupportedLanguages.labelForCode(
      selectedLocale?.languageCode,
      systemLabel,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.settingsTitle ?? 'Settings'),
      ),
      body: SafeArea(
        child: ListView(
          padding: AppTokens.paddingScreen,
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    key: const Key('settings_app_language_tile'),
                    leading: Icon(Icons.language, color: colorScheme.primary),
                    title: Text(l10n?.appLanguageTitle ?? 'App Language'),
                    subtitle: Text(currentLanguageLabel),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const LanguageSettingsScreen(),
                        ),
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    color: colorScheme.outline.withValues(alpha: 0.4),
                  ),
                  ListTile(
                    key: const Key('settings_theme_tile'),
                    leading: Icon(
                      Icons.brightness_6_outlined,
                      color: colorScheme.primary,
                    ),
                    title: Text(l10n?.themeTitle ?? 'Theme'),
                    subtitle: Text(_themeLabel(l10n, selectedThemeMode)),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () =>
                        _showThemeDialog(context, ref, selectedThemeMode),
                  ),
                  Divider(
                    height: 1,
                    color: colorScheme.outline.withValues(alpha: 0.4),
                  ),
                  ListTile(
                    key: const Key('settings_app_version_tile'),
                    leading: Icon(
                      Icons.info_outline,
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    title: Text(l10n?.appVersionTitle ?? 'App Version'),
                    subtitle: const Text(appVersionLabel),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
