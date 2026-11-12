import 'package:flutter/material.dart';

/// Ergonomic layout tokens, spacing, and accessibility constraints.
class AppTokens {
  AppTokens._(); // coverage:ignore-line

  /// Mandatory minimum touch target dimension (>= 48x48 dp) for reliable
  /// tactile interaction in workshop, makerspace, and lab environments.
  static const double minTouchTarget = 48.0;

  // Spacing & Padding
  static const double space2 = 2.0;
  static const double space4 = 4.0;
  static const double space8 = 8.0;
  static const double space12 = 12.0;
  static const double space16 = 16.0;
  static const double space20 = 20.0;
  static const double space24 = 24.0;
  static const double space32 = 32.0;

  // Border Radii
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusFull = 999.0;

  // Standard EdgeInsets
  static const EdgeInsets paddingScreen = EdgeInsets.all(space16);
  static const EdgeInsets paddingCard = EdgeInsets.all(space16);
  static const EdgeInsets paddingButton = EdgeInsets.symmetric(
    horizontal: space20,
    vertical: space12,
  );

  // Border Radii Helpers
  static final BorderRadius borderRadiusSm = BorderRadius.circular(radiusSm);
  static final BorderRadius borderRadiusMd = BorderRadius.circular(radiusMd);
  static final BorderRadius borderRadiusLg = BorderRadius.circular(radiusLg);
}
