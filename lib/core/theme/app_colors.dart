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
