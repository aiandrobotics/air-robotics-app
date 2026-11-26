import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_tokens.dart';

/// Configured dark safety theme for AIR Robotics.
class AppTheme {
  AppTheme._(); // coverage:ignore-line

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.cyan,
        onPrimary: AppColors.textOnAccent,
        secondary: AppColors.amber,
        onSecondary: AppColors.textOnAccent,
        error: AppColors.crimson,
        onError: AppColors.textPrimary,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
        outline: AppColors.border,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceElevated,
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.borderRadiusMd,
          side: const BorderSide(color: AppColors.border, width: 1.0),
        ),
        elevation: 0,
        margin: EdgeInsets.zero,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        iconTheme: IconThemeData(color: AppColors.textPrimary),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.cyan,
        unselectedItemColor: AppColors.textMuted,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.cyan,
        inactiveTrackColor: AppColors.surfaceHighlight,
        thumbColor: AppColors.cyan,
        overlayColor: AppColors.cyan.withValues(alpha: 0.15),
        trackHeight: 6.0,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.surfaceElevated,
          foregroundColor: AppColors.textPrimary,
          minimumSize: const Size(
            AppTokens.minTouchTarget,
            AppTokens.minTouchTarget,
          ),
          padding: AppTokens.paddingButton,
          shape: RoundedRectangleBorder(
            borderRadius: AppTokens.borderRadiusSm,
            side: const BorderSide(color: AppColors.border),
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.textPrimary,
        size: 24.0,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.cyan.withValues(alpha: 0.18),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.cyan);
          }
          return const IconThemeData(color: AppColors.textSecondary);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.cyan,
            );
          }
          return const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          );
        }),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.surfaceElevated,
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.borderRadiusMd,
          side: const BorderSide(color: AppColors.border),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.borderRadiusLg,
          side: const BorderSide(color: AppColors.border),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
      ),
    );
  }

  static ThemeData get lightTheme {
    const p = AppPalette.light;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: p.background,
      colorScheme: ColorScheme.light(
        primary: p.cyan,
        onPrimary: p.textOnAccent,
        secondary: p.amber,
        onSecondary: Colors.white,
        error: p.crimson,
        onError: Colors.white,
        surface: p.surface,
        onSurface: p.textPrimary,
        outline: p.border,
      ),
      cardTheme: CardThemeData(
        color: p.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.borderRadiusMd,
          side: BorderSide(color: p.border, width: 1.0),
        ),
        elevation: 0,
        margin: EdgeInsets.zero,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: p.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: p.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        iconTheme: IconThemeData(color: p.textPrimary),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: p.surface,
        selectedItemColor: p.cyan,
        unselectedItemColor: p.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: p.surface,
        elevation: 4,
        indicatorColor: p.cyan.withValues(alpha: 0.14),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: p.cyan);
          }
          return IconThemeData(color: p.textSecondary);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: p.cyan,
            );
          }
          return TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: p.textSecondary,
          );
        }),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: p.cyan,
        inactiveTrackColor: p.surfaceHighlight,
        thumbColor: p.cyan,
        overlayColor: p.cyan.withValues(alpha: 0.15),
        trackHeight: 6.0,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: p.surfaceHighlight,
          foregroundColor: p.textPrimary,
          minimumSize: const Size(
            AppTokens.minTouchTarget,
            AppTokens.minTouchTarget,
          ),
          padding: AppTokens.paddingButton,
          shape: RoundedRectangleBorder(
            borderRadius: AppTokens.borderRadiusSm,
            side: BorderSide(color: p.border),
          ),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: p.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.borderRadiusMd,
          side: BorderSide(color: p.border),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: p.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.borderRadiusLg,
          side: BorderSide(color: p.border),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: p.border,
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: p.textSecondary),
        hintStyle: TextStyle(color: p.textMuted),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: p.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: p.cyan, width: 1.5),
        ),
      ),
      iconTheme: IconThemeData(
        color: p.textPrimary,
        size: 24.0,
      ),
    );
  }
}
