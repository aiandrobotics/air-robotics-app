import 'dart:io';

import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/fleet/fleet_providers.dart';
import 'package:air_robotics_app/core/fleet/fleet_storage_service.dart';
import 'package:air_robotics_app/core/localization/locale_provider.dart';
import 'package:air_robotics_app/core/localization/supported_languages.dart';
import 'package:air_robotics_app/core/profile/profile_providers.dart';
import 'package:air_robotics_app/core/profile/profile_storage_service.dart';
import 'package:air_robotics_app/core/profile/profile_validator.dart';
import 'package:air_robotics_app/core/theme/app_colors.dart';
import 'package:air_robotics_app/core/theme/app_theme.dart';
import 'package:air_robotics_app/core/theme/theme_mode_provider.dart';
import 'package:air_robotics_app/l10n/app_localizations.dart';
import 'package:air_robotics_app/main.dart';
import 'package:air_robotics_app/screens/settings_screen.dart';
import 'package:air_robotics_app/ui_engine/dynamic_screen_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('SettingsScreen & Localization/Theme', () {
    testWidgets(
      'displays App Language and App Version list items, opens language dropdown page with all Android languages, and updates locale',
      (WidgetTester tester) async {
        late ProviderContainer container;

        await tester.pumpWidget(
          ProviderScope(
            child: Consumer(
              builder: (context, ref, _) {
                container = ProviderScope.containerOf(context);
                final locale = ref.watch(localeProvider);
                return MaterialApp(
                  locale: locale,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: const SettingsScreen(),
                );
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(container.read(localeProvider), isNull);
        expect(find.text('Settings'), findsOneWidget);
        expect(find.text('App Language'), findsOneWidget);
        expect(find.text('System Default (Device Language)'), findsOneWidget);
        expect(find.text('App Version'), findsOneWidget);
        expect(find.text(SettingsScreen.appVersionLabel), findsOneWidget);

        // Tap App Language to open LanguageSettingsScreen
        await tester.tap(find.byKey(const Key('settings_app_language_tile')));
        await tester.pumpAndSettle();

        final dropdownFinder = find.byKey(const Key('language_dropdown'));
        expect(dropdownFinder, findsOneWidget);
        expect(SupportedLanguages.all.length, equals(82));

        // Open dropdown and scroll to Español (Spanish)
        await tester.tap(dropdownFinder);
        await tester.pumpAndSettle();

        final esItem = find.text('Español (Spanish)');
        await tester.scrollUntilVisible(
          esItem,
          300,
          scrollable: find.byType(Scrollable).last,
        );
        await tester.tap(esItem.last);
        await tester.pumpAndSettle();

        expect(container.read(localeProvider), const Locale('es'));
        expect(find.text('Idioma de la aplicación'), findsOneWidget);
        expect(find.text('SELECCIONAR UN IDIOMA'), findsOneWidget);

        // Navigate back to SettingsScreen and verify translated list items
        await tester.tap(find.byType(BackButton));
        await tester.pumpAndSettle();

        expect(find.text('Configuración'), findsOneWidget);
        expect(find.text('Idioma de la aplicación'), findsOneWidget);
        expect(find.text('Versión de la aplicación'), findsOneWidget);
      },
    );

    testWidgets(
      'selecting Bengali updates Home screen (LandingDashboardScreen) text to Bengali',
      (WidgetTester tester) async {
        final mockTransport = MockBleTransport();
        final mockFleetStorage = InMemoryFleetStorageService();
        final mockProfileStorage = InMemoryProfileStorageService();

        late ProviderContainer container;
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              bleTransportProvider.overrideWithValue(mockTransport),
              fleetStorageProvider.overrideWithValue(mockFleetStorage),
              profileStorageProvider.overrideWithValue(mockProfileStorage),
            ],
            child: Consumer(
              builder: (context, ref, _) {
                container = ProviderScope.containerOf(context);
                return const AirRoboticsApp();
              },
            ),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Initially English
        expect(find.text('YOUR ROBOTS'), findsOneWidget);
        expect(find.text('ADD NEW ROBOT'), findsOneWidget);

        // Switch locale to Bengali ('bn')
        await container
            .read(localeProvider.notifier)
            .setLocale(const Locale('bn'));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.text('আপনার রোবটসমূহ'), findsOneWidget);
        expect(find.text('নতুন রোবট যোগ করুন'), findsOneWidget);
        expect(find.text('খুঁজে পাওয়া রোবটসমূহ'), findsOneWidget);
        expect(find.text('এখনও কোনো রোবট পেয়ার করা হয়নি'), findsOneWidget);

        mockTransport.dispose();
        mockFleetStorage.close();
        mockProfileStorage.close();
      },
    );

    testWidgets(
      'AirRoboticsApp configures lightTheme, darkTheme, ThemeMode.system, and system locale default',
      (WidgetTester tester) async {
        final mockTransport = MockBleTransport();
        final mockFleetStorage = InMemoryFleetStorageService();
        final mockProfileStorage = InMemoryProfileStorageService();

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              bleTransportProvider.overrideWithValue(mockTransport),
              fleetStorageProvider.overrideWithValue(mockFleetStorage),
              profileStorageProvider.overrideWithValue(mockProfileStorage),
            ],
            child: const AirRoboticsApp(),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        final materialApp = tester.widget<MaterialApp>(
          find.byType(MaterialApp),
        );
        expect(materialApp.theme?.brightness, equals(Brightness.light));
        expect(
          materialApp.theme?.scaffoldBackgroundColor,
          equals(AppPalette.light.background),
        );
        expect(materialApp.darkTheme?.brightness, equals(Brightness.dark));
        expect(
          materialApp.darkTheme?.scaffoldBackgroundColor,
          equals(AppPalette.dark.background),
        );
        expect(materialApp.themeMode, equals(ThemeMode.system));
        expect(materialApp.locale, isNull);
        expect(
          materialApp.supportedLocales.length,
          equals(82),
        );

        mockTransport.dispose();
        mockFleetStorage.close();
        mockProfileStorage.close();
      },
    );

    testWidgets(
      'SettingsScreen allows selecting Light, Dark, and Device theme mode with Device as default',
      (WidgetTester tester) async {
        late ProviderContainer container;

        await tester.pumpWidget(
          ProviderScope(
            child: Consumer(
              builder: (context, ref, _) {
                container = ProviderScope.containerOf(context);
                final themeMode = ref.watch(themeModeProvider);
                return MaterialApp(
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: themeMode,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: const SettingsScreen(),
                );
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(container.read(themeModeProvider), ThemeMode.system);
        expect(find.text('Theme'), findsOneWidget);
        expect(find.text('Device'), findsOneWidget);

        // Open Theme dialog and choose Light
        await tester.tap(find.byKey(const Key('settings_theme_tile')));
        await tester.pumpAndSettle();

        expect(find.text('Light'), findsOneWidget);
        expect(find.text('Dark'), findsOneWidget);
        await tester.tap(find.text('Light'));
        await tester.pumpAndSettle();

        expect(container.read(themeModeProvider), ThemeMode.light);
        expect(find.text('Light'), findsOneWidget);

        // Switch to Dark
        await tester.tap(find.byKey(const Key('settings_theme_tile')));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Dark'));
        await tester.pumpAndSettle();

        expect(container.read(themeModeProvider), ThemeMode.dark);
        expect(find.text('Dark'), findsOneWidget);
      },
    );

    testWidgets(
      'selecting Bengali translates Device Details, Control, Sequencer, and Calibrator pages',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(800, 1400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final schemaStr =
            File('assets/profiles/air-device-profile.schema.json')
                .readAsStringSync();
        final profileStr =
            File('assets/profiles/fabrica-devkit-v1.json').readAsStringSync();
        final profile = ProfileValidator.validateStrings(
          schemaString: schemaStr,
          profileString: profileStr,
        );

        final mockTransport = MockBleTransport();
        final mockFleetStorage = InMemoryFleetStorageService();
        final mockProfileStorage = InMemoryProfileStorageService();

        final container = ProviderContainer(
          overrides: [
            bleTransportProvider.overrideWithValue(mockTransport),
            fleetStorageProvider.overrideWithValue(mockFleetStorage),
            profileStorageProvider.overrideWithValue(mockProfileStorage),
          ],
        );
        addTearDown(container.dispose);
        container.read(activeProfileProvider.notifier).selectProfile(profile);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              locale: Locale('bn'),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: DynamicScreenScaffold(),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Bottom navigation tabs in Bengali (Control, Sequencer, Arrangement)
        expect(find.text('নিয়ন্ত্রণ'), findsOneWidget);
        expect(find.text('সিকোয়েন্সার'), findsOneWidget);
        expect(find.text('Arrangement'), findsOneWidget);

        // Control tab (default index 0)
        expect(find.text('সব হোম করুন'), findsOneWidget);
        expect(find.text('প্রিসেট বাটনসমূহ'), findsOneWidget);
        expect(find.text('জরুরি থামান'), findsOneWidget);

        // Switch to Sequencer tab
        await tester.tap(find.text('সিকোয়েন্সার'));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('sequencer_compact_flap_map')), findsOneWidget);
        expect(find.text('ফোল্ডিং টাইমলাইন'), findsOneWidget);
        expect(
          find.text('ধাপ 1 নির্বাচিত: গ্রিডে ১–২টি মোটরচালিত প্যানেল ট্যাপ করুন'),
          findsOneWidget,
        );
        expect(find.text('রোবটে প্রিভিউ'), findsOneWidget);
        expect(find.text('বাটনে সংরক্ষণ করুন 1'), findsOneWidget);

        // Switch to Arrangement tab
        await tester.tap(find.text('Arrangement'));
        await tester.pumpAndSettle();
        expect(find.text('FABRICA বিন্যাস'), findsOneWidget);

        // Open Debug Panel -> Calibrator tab in Bengali
        await tester.tap(find.byTooltip('আরও হার্ডওয়্যার বিকল্প'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Debug Panel'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('ক্যালিব্রেটর'));
        await tester.pumpAndSettle();
        expect(find.text('সার্ভো ম্যানুয়াল জোগ'), findsOneWidget);
        expect(find.text('চ্যানেল 1'), findsOneWidget);
      },
    );

    testWidgets(
      'AppColors.of(context) resolves to high-contrast Light and Dark palettes',
      (WidgetTester tester) async {
        late AppPalette lightResolved;
        late AppPalette darkResolved;

        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: Builder(
              builder: (context) {
                lightResolved = AppColors.of(context);
                return const SizedBox.shrink();
              },
            ),
          ),
        );
        expect(lightResolved.isDark, isFalse);
        expect(lightResolved.surface, AppPalette.light.surface);
        expect(lightResolved.textPrimary, AppPalette.light.textPrimary);
        expect(lightResolved.cyan, AppPalette.light.cyan);
        expect(lightResolved.textOnAccent, Colors.white);

        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.dark,
            home: Builder(
              key: const ValueKey('dark_builder'),
              builder: (context) {
                darkResolved = AppColors.of(context);
                return const SizedBox.shrink();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(darkResolved.isDark, isTrue);
        expect(darkResolved.surface, AppPalette.dark.surface);
        expect(darkResolved.textPrimary, AppPalette.dark.textPrimary);
        expect(darkResolved.cyan, AppPalette.dark.cyan);
        expect(darkResolved.textOnAccent, Colors.black);
      },
    );
  });
}
