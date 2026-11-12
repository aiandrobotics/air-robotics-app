import 'package:air_robotics_app/core/theme/app_colors.dart';
import 'package:air_robotics_app/core/theme/app_theme.dart';
import 'package:air_robotics_app/core/theme/app_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme & AppColors Tests', () {
    test('AppColors stateColor maps all machine states correctly', () {
      expect(AppColors.stateColor(0), equals(AppColors.textSecondary));
      expect(AppColors.stateColor(1), equals(AppColors.cyan));
      expect(AppColors.stateColor(2), equals(AppColors.crimson));
      expect(AppColors.stateColor(3), equals(AppColors.crimson));
      expect(AppColors.stateColor(4), equals(AppColors.amber));
      expect(AppColors.stateColor(99), equals(AppColors.textSecondary));
    });

    test('AppColors ledColor maps all LED states correctly', () {
      expect(AppColors.ledColor(0), equals(AppColors.textMuted));
      expect(AppColors.ledColor(1), equals(AppColors.cyan));
      expect(AppColors.ledColor(2), equals(AppColors.emerald));
      expect(AppColors.ledColor(3), equals(AppColors.amber));
      expect(AppColors.ledColor(4), equals(AppColors.crimson));
      expect(AppColors.ledColor(5), equals(AppColors.amber));
      expect(AppColors.ledColor(6), equals(AppColors.emerald));
      expect(AppColors.ledColor(7), equals(AppColors.purple));
      expect(AppColors.ledColor(99), equals(AppColors.textMuted));
    });

    test('AppTokens dimensions and border radii helpers', () {
      expect(AppTokens.minTouchTarget, equals(48.0));
      expect(AppTokens.space2, equals(2.0));
      expect(AppTokens.space4, equals(4.0));
      expect(AppTokens.space8, equals(8.0));
      expect(AppTokens.space12, equals(12.0));
      expect(AppTokens.space16, equals(16.0));
      expect(AppTokens.space20, equals(20.0));
      expect(AppTokens.space24, equals(24.0));
      expect(AppTokens.space32, equals(32.0));
      expect(AppTokens.radiusXs, equals(4.0));
      expect(AppTokens.radiusSm, equals(8.0));
      expect(AppTokens.radiusMd, equals(12.0));
      expect(AppTokens.radiusLg, equals(16.0));
      expect(AppTokens.radiusFull, equals(999.0));
      expect(AppTokens.paddingScreen, equals(const EdgeInsets.all(16.0)));
      expect(AppTokens.paddingCard, equals(const EdgeInsets.all(16.0)));
      expect(AppTokens.paddingButton, equals(const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0)));
      expect(AppTokens.borderRadiusSm, equals(BorderRadius.circular(8.0)));
      expect(AppTokens.borderRadiusMd, equals(BorderRadius.circular(12.0)));
      expect(AppTokens.borderRadiusLg, equals(BorderRadius.circular(16.0)));
    });

    test('AppTheme darkTheme builds valid industrial dark theme', () {
      final theme = AppTheme.darkTheme;
      expect(theme.brightness, equals(Brightness.dark));
      expect(theme.scaffoldBackgroundColor, equals(AppColors.background));
      expect(theme.colorScheme.primary, equals(AppColors.cyan));
      expect(theme.colorScheme.error, equals(AppColors.crimson));
    });
  });
}
