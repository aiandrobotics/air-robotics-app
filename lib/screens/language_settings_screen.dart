import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/localization/locale_provider.dart';
import '../core/localization/supported_languages.dart';
import '../core/theme/app_tokens.dart';
import '../l10n/app_localizations.dart';

/// Dedicated language selector screen with a dropdown of all Android-supported languages.
class LanguageSettingsScreen extends ConsumerWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final selectedLocale = ref.watch(localeProvider);
    final localeNotifier = ref.read(localeProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final systemLabel =
        l10n?.languageSystemDefault ?? 'System Default (Device Language)';

    final currentCode = selectedLocale?.languageCode;
    final dropdownValue = SupportedLanguages.all.any((l) => l.code == currentCode)
        ? currentCode
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.appLanguageTitle ?? 'App Language'),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppTokens.paddingScreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (l10n?.selectLanguageHint ?? 'Select a language').toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: AppTokens.space12),
              DropdownButtonFormField<String?>(
                key: const Key('language_dropdown'),
                initialValue: dropdownValue,
                isExpanded: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.language, color: colorScheme.primary),
                  border: OutlineInputBorder(
                    borderRadius: AppTokens.borderRadiusMd,
                  ),
                ),
                items: [
                  DropdownMenuItem<String?>(
                    value: null,
                    child: Text(
                      systemLabel,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  for (final lang in SupportedLanguages.all)
                    DropdownMenuItem<String?>(
                      value: lang.code,
                      child: Text(
                        lang.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
                onChanged: (code) {
                  localeNotifier.setLocale(code == null ? null : Locale(code));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
