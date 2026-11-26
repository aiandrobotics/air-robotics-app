import 'package:flutter/material.dart';

/// Industrial Dark Mode safety palette and design tokens for AIR Robotics.
class AppColors {
  AppColors._(); // coverage:ignore-line

  // Backgrounds & Surfaces
  static const Color background = Color(0xFF0A0A0E);
  static const Color surface = Color(0xFF14141B);
  static const Color surfaceElevated = Color(0xFF1E1E28);
  static const Color surfaceHighlight = Color(0xFF282836);

  // Borders & Grid lines
  static const Color border = Color(0xFF262636);
  static const Color borderFocused = Color(0xFF00E5FF);

  // High-Contrast Safety Accents
  static const Color cyan = Color(0xFF00E5FF); // Precision / Telemetry Active
  static const Color amber = Color(0xFFFFB300); // Warning / Pairing / Busy
  static const Color crimson = Color(0xFFFF1744); // E-Stop / Critical Error
  static const Color emerald = Color(0xFF00E676); // Connected / Save Success
  static const Color purple = Color(0xFFD500F9); // Special Routine / Raw Mode

  // Text Colors
  static const Color textPrimary = Color(0xFFF0F4F8);
  static const Color textSecondary = Color(0xFF90A4AE);
  static const Color textMuted = Color(0xFF546E7A);
  static const Color textOnAccent = Color(0xFF000000);

  /// Returns the theme-aware palette matching [Theme.of(context).brightness].
  static AppPalette of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppPalette.dark
        : AppPalette.light;
  }

  // Machine State Color Mapping
  static Color stateColor(int stateValue) {
    switch (stateValue) {
      case 0: // IDLE
        return textSecondary;
      case 1: // RUNNING_MOTION
        return cyan;
      case 2: // ESTOP
        return crimson;
      case 3: // ERROR
        return crimson;
      case 4: // CALIBRATING
        return amber;
      default:
        return textSecondary;
    }
  }

  // LED Pattern Color Mapping
  static Color ledColor(int ledValue) {
    switch (ledValue) {
      case 0: // IDLE
        return textMuted;
      case 1: // RUNNING
        return cyan;
      case 2: // SAVE_SUCCESS
        return emerald;
      case 3: // INPUT_ERROR
        return amber;
      case 4: // ESTOP
        return crimson;
      case 5: // PAIRING
        return amber;
      case 6: // CONNECTED
        return emerald;
      case 7: // IDENTIFY
        return purple;
      default:
        return textMuted;
    }
  }
}

/// Brightness-aware color palette for both Dark and Light modes.
class AppPalette {
  final Brightness brightness;
  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color surfaceHighlight;
  final Color border;
  final Color borderFocused;
  final Color cyan;
  final Color amber;
  final Color crimson;
  final Color emerald;
  final Color purple;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color textOnAccent;

  const AppPalette({
    required this.brightness,
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.surfaceHighlight,
    required this.border,
    required this.borderFocused,
    required this.cyan,
    required this.amber,
    required this.crimson,
    required this.emerald,
    required this.purple,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.textOnAccent,
  });

  bool get isDark => brightness == Brightness.dark;

  static const AppPalette dark = AppPalette(
    brightness: Brightness.dark,
    background: AppColors.background,
    surface: AppColors.surface,
    surfaceElevated: AppColors.surfaceElevated,
    surfaceHighlight: AppColors.surfaceHighlight,
    border: AppColors.border,
    borderFocused: AppColors.borderFocused,
    cyan: AppColors.cyan,
    amber: AppColors.amber,
    crimson: AppColors.crimson,
    emerald: AppColors.emerald,
    purple: AppColors.purple,
    textPrimary: AppColors.textPrimary,
    textSecondary: AppColors.textSecondary,
    textMuted: AppColors.textMuted,
    textOnAccent: AppColors.textOnAccent,
  );

  static const AppPalette light = AppPalette(
    brightness: Brightness.light,
    background: Color(0xFFF4F7FA),
    surface: Color(0xFFFFFFFF),
    surfaceElevated: Color(0xFFFFFFFF),
    surfaceHighlight: Color(0xFFE6EDF5),
    border: Color(0xFFCBD5E1),
    borderFocused: Color(0xFF007C91),
    cyan: Color(0xFF007C91),
    amber: Color(0xFFB45309),
    crimson: Color(0xFFD32F2F),
    emerald: Color(0xFF047857),
    purple: Color(0xFF7E22CE),
    textPrimary: Color(0xFF0F172A),
    textSecondary: Color(0xFF475569),
    textMuted: Color(0xFF64748B),
    textOnAccent: Color(0xFFFFFFFF),
  );
}

extension AppColorsContext on BuildContext {
  AppPalette get colors => AppColors.of(this);
}
