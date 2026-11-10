import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Flap identification enum mapping directly to ESP32 firmware servo channels.
enum FabricaFlap {
  left(0, 'Left Flap'),
  right(1, 'Right Flap'),
  bottom(2, 'Bottom Flap'),
  top(3, 'Top Flap');

  final int channel;
  final String displayName;
  const FabricaFlap(this.channel, this.displayName);

  static FabricaFlap fromChannel(int ch) {
    switch (ch) {
      case 0:
        return FabricaFlap.left;
      case 1:
        return FabricaFlap.right;
      case 2:
        return FabricaFlap.bottom;
      case 3:
        return FabricaFlap.top;
      default:
        return FabricaFlap.left;
    }
  }
}

/// Geometric layout and planar fold kinematics calculations for Fabrica.
class FabricaGeometry {
  final Size canvasSize;

  late final Rect basePlateRect;
  late final double flapWidth;
  late final double flapHeight;

  FabricaGeometry({required this.canvasSize}) {
    final cx = canvasSize.width / 2;
    final cy = canvasSize.height / 2;

    // Base plate occupies central 40% width and 45% height
    final bw = canvasSize.width * 0.36;
    final bh = canvasSize.height * 0.40;

    basePlateRect = Rect.fromCenter(
      center: Offset(cx, cy),
      width: bw,
      height: bh,
    );

    flapWidth = bw * 0.75;
    flapHeight = bh * 0.65;
  }

  /// Calculates the projected 2D polygon bounding the flap at [angleDeg] (0° to 180°).
  Rect getFlapRect(FabricaFlap flap, double angleDeg) {
    final rad = angleDeg.clamp(0.0, 180.0) * math.pi / 180.0;
    final cosAngle = math.cos(rad); // 1.0 (flat/open) -> -1.0 (folded over base)

    switch (flap) {
      case FabricaFlap.left:
        final hingeX = basePlateRect.left;
        final currentSpan = flapWidth * cosAngle;
        if (currentSpan >= 0) {
          // Open to the left: extends from (hingeX - currentSpan) to hingeX
          return Rect.fromLTRB(
            hingeX - currentSpan,
            basePlateRect.top + 4,
            hingeX,
            basePlateRect.bottom - 4,
          );
        } else {
          // Folded over base: extends from hingeX to (hingeX + abs(currentSpan))
          return Rect.fromLTRB(
            hingeX,
            basePlateRect.top + 4,
            hingeX - currentSpan,
            basePlateRect.bottom - 4,
          );
        }

      case FabricaFlap.right:
        final hingeX = basePlateRect.right;
        final currentSpan = flapWidth * cosAngle;
        if (currentSpan >= 0) {
          // Open to the right: extends from hingeX to (hingeX + currentSpan)
          return Rect.fromLTRB(
            hingeX,
            basePlateRect.top + 4,
            hingeX + currentSpan,
            basePlateRect.bottom - 4,
          );
        } else {
          // Folded over base: extends from (hingeX - abs(currentSpan)) to hingeX
          return Rect.fromLTRB(
            hingeX + currentSpan,
            basePlateRect.top + 4,
            hingeX,
            basePlateRect.bottom - 4,
          );
        }

      case FabricaFlap.bottom:
        final hingeY = basePlateRect.bottom;
        final currentSpan = flapHeight * cosAngle;
        if (currentSpan >= 0) {
          // Open downwards: extends from hingeY to (hingeY + currentSpan)
          return Rect.fromLTRB(
            basePlateRect.left + 4,
            hingeY,
            basePlateRect.right - 4,
            hingeY + currentSpan,
          );
        } else {
          // Folded upwards over base: extends from (hingeY - abs(currentSpan)) to hingeY
          return Rect.fromLTRB(
            basePlateRect.left + 4,
            hingeY + currentSpan,
            basePlateRect.right - 4,
            hingeY,
          );
        }

      case FabricaFlap.top:
        final hingeY = basePlateRect.top;
        final currentSpan = flapHeight * cosAngle;
        if (currentSpan >= 0) {
          // Open upwards: extends from (hingeY - currentSpan) to hingeY
          return Rect.fromLTRB(
            basePlateRect.left + 4,
            hingeY - currentSpan,
            basePlateRect.right - 4,
            hingeY,
          );
        } else {
          // Folded downwards over base: extends from hingeY to (hingeY + abs(currentSpan))
          return Rect.fromLTRB(
            basePlateRect.left + 4,
            hingeY,
            basePlateRect.right - 4,
            hingeY - currentSpan,
          );
        }
    }
  }

  /// Calculates elevation/shadow depth factor $\in [0.0, 1.0]$.
  double getElevationFactor(double angleDeg) {
    final rad = angleDeg.clamp(0.0, 180.0) * math.pi / 180.0;
    return math.sin(rad);
  }

  /// Hit-tests a touch position against the resting/open area of the flaps.
  FabricaFlap? hitTestFlap(Offset position) {
    for (final flap in FabricaFlap.values) {
      // Test against open bounds (angle 0°) with generous touch padding
      final openRect = getFlapRect(flap, 0.0).inflate(16);
      if (openRect.contains(position)) {
        return flap;
      }
    }
    return null;
  }

  /// Computes target angle in degrees [0, 180] corresponding to a drag position.
  double computeAngleFromDrag(FabricaFlap flap, Offset position) {
    switch (flap) {
      case FabricaFlap.left:
        final minX = basePlateRect.left - flapWidth;
        final maxX = basePlateRect.left + flapWidth;
        final fraction = (position.dx - minX) / (maxX - minX);
        return (fraction * 180.0).clamp(0.0, 180.0);

      case FabricaFlap.right:
        final minX = basePlateRect.right - flapWidth;
        final maxX = basePlateRect.right + flapWidth;
        final fraction = (maxX - position.dx) / (maxX - minX);
        return (fraction * 180.0).clamp(0.0, 180.0);

      case FabricaFlap.bottom:
        final minY = basePlateRect.bottom - flapHeight;
        final maxY = basePlateRect.bottom + flapHeight;
        final fraction = (maxY - position.dy) / (maxY - minY);
        return (fraction * 180.0).clamp(0.0, 180.0);

      case FabricaFlap.top:
        final minY = basePlateRect.top - flapHeight;
        final maxY = basePlateRect.top + flapHeight;
        final fraction = (position.dy - minY) / (maxY - minY);
        return (fraction * 180.0).clamp(0.0, 180.0);
    }
  }
}
