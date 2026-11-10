import 'package:air_robotics_app/visualizers/fabrica/fabrica_geometry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FabricaFlap Enum Tests', () {
    test('maps channels to expected enum values', () {
      expect(FabricaFlap.fromChannel(0), FabricaFlap.left);
      expect(FabricaFlap.fromChannel(1), FabricaFlap.right);
      expect(FabricaFlap.fromChannel(2), FabricaFlap.bottom);
      expect(FabricaFlap.fromChannel(3), FabricaFlap.top);
      expect(FabricaFlap.fromChannel(99), FabricaFlap.left);
    });

    test('exposes correct display names and channels', () {
      expect(FabricaFlap.left.channel, 0);
      expect(FabricaFlap.left.displayName, 'Left Flap');
      expect(FabricaFlap.right.channel, 1);
      expect(FabricaFlap.right.displayName, 'Right Flap');
      expect(FabricaFlap.bottom.channel, 2);
      expect(FabricaFlap.bottom.displayName, 'Bottom Flap');
      expect(FabricaFlap.top.channel, 3);
      expect(FabricaFlap.top.displayName, 'Top Flap');
    });
  });

  group('FabricaGeometry Kinematic & Projection Tests', () {
    const canvasSize = Size(400, 300);
    late FabricaGeometry geometry;

    setUp(() {
      geometry = FabricaGeometry(canvasSize: canvasSize);
    });

    test('initializes base plate and flap sizes correctly', () {
      expect(geometry.basePlateRect.center, const Offset(200, 150));
      expect(geometry.basePlateRect.width, closeTo(400 * 0.36, 0.01));
      expect(geometry.basePlateRect.height, closeTo(300 * 0.40, 0.01));
      expect(geometry.flapWidth, closeTo(geometry.basePlateRect.width * 0.75, 0.01));
      expect(geometry.flapHeight, closeTo(geometry.basePlateRect.height * 0.65, 0.01));
    });

    test('calculates planar projection at 0 degrees (fully open)', () {
      final leftRect = geometry.getFlapRect(FabricaFlap.left, 0.0);
      expect(leftRect.right, geometry.basePlateRect.left);
      expect(leftRect.width, closeTo(geometry.flapWidth, 0.01));

      final rightRect = geometry.getFlapRect(FabricaFlap.right, 0.0);
      expect(rightRect.left, geometry.basePlateRect.right);
      expect(rightRect.width, closeTo(geometry.flapWidth, 0.01));

      final bottomRect = geometry.getFlapRect(FabricaFlap.bottom, 0.0);
      expect(bottomRect.top, geometry.basePlateRect.bottom);
      expect(bottomRect.height, closeTo(geometry.flapHeight, 0.01));

      final topRect = geometry.getFlapRect(FabricaFlap.top, 0.0);
      expect(topRect.bottom, geometry.basePlateRect.top);
      expect(topRect.height, closeTo(geometry.flapHeight, 0.01));
    });

    test('calculates planar projection at 90 degrees (vertical / zero span)', () {
      final leftRect = geometry.getFlapRect(FabricaFlap.left, 90.0);
      expect(leftRect.width, closeTo(0.0, 0.01));

      final rightRect = geometry.getFlapRect(FabricaFlap.right, 90.0);
      expect(rightRect.width, closeTo(0.0, 0.01));

      final bottomRect = geometry.getFlapRect(FabricaFlap.bottom, 90.0);
      expect(bottomRect.height, closeTo(0.0, 0.01));

      final topRect = geometry.getFlapRect(FabricaFlap.top, 90.0);
      expect(topRect.height, closeTo(0.0, 0.01));
    });

    test('calculates planar projection at 180 degrees (folded over base plate)', () {
      final leftRect = geometry.getFlapRect(FabricaFlap.left, 180.0);
      // Folded left flap extends from hinge inward towards center
      expect(leftRect.left, geometry.basePlateRect.left);
      expect(leftRect.width, closeTo(geometry.flapWidth, 0.01));

      final rightRect = geometry.getFlapRect(FabricaFlap.right, 180.0);
      // Folded right flap extends from right hinge inward to center
      expect(rightRect.right, geometry.basePlateRect.right);
      expect(rightRect.width, closeTo(geometry.flapWidth, 0.01));

      final bottomRect = geometry.getFlapRect(FabricaFlap.bottom, 180.0);
      expect(bottomRect.bottom, geometry.basePlateRect.bottom);
      expect(bottomRect.height, closeTo(geometry.flapHeight, 0.01));

      final topRect = geometry.getFlapRect(FabricaFlap.top, 180.0);
      expect(topRect.top, geometry.basePlateRect.top);
      expect(topRect.height, closeTo(geometry.flapHeight, 0.01));
    });

    test('calculates elevation factors as sin(theta)', () {
      expect(geometry.getElevationFactor(0.0), closeTo(0.0, 0.001));
      expect(geometry.getElevationFactor(30.0), closeTo(0.5, 0.001));
      expect(geometry.getElevationFactor(90.0), closeTo(1.0, 0.001));
      expect(geometry.getElevationFactor(180.0), closeTo(0.0, 0.001));
    });

    test('hitTestFlap identifies correct resting flap position', () {
      final leftHinge = geometry.basePlateRect.centerLeft;
      final hitLeft = geometry.hitTestFlap(leftHinge.translate(-30, 0));
      expect(hitLeft, FabricaFlap.left);

      final rightHinge = geometry.basePlateRect.centerRight;
      final hitRight = geometry.hitTestFlap(rightHinge.translate(30, 0));
      expect(hitRight, FabricaFlap.right);

      final bottomHinge = geometry.basePlateRect.bottomCenter;
      final hitBottom = geometry.hitTestFlap(bottomHinge.translate(0, 30));
      expect(hitBottom, FabricaFlap.bottom);

      final topHinge = geometry.basePlateRect.topCenter;
      final hitTop = geometry.hitTestFlap(topHinge.translate(0, -30));
      expect(hitTop, FabricaFlap.top);

      final farCorner = const Offset(5, 5);
      expect(geometry.hitTestFlap(farCorner), isNull);
    });

    test('computeAngleFromDrag maps touch positions across 0 to 180 degrees', () {
      // Left flap
      final minX = geometry.basePlateRect.left - geometry.flapWidth;
      final hingeX = geometry.basePlateRect.left;
      final maxX = geometry.basePlateRect.left + geometry.flapWidth;

      expect(geometry.computeAngleFromDrag(FabricaFlap.left, Offset(minX, 150)), closeTo(0.0, 0.01));
      expect(geometry.computeAngleFromDrag(FabricaFlap.left, Offset(hingeX, 150)), closeTo(90.0, 0.01));
      expect(geometry.computeAngleFromDrag(FabricaFlap.left, Offset(maxX, 150)), closeTo(180.0, 0.01));

      // Right flap
      final rMinX = geometry.basePlateRect.right - geometry.flapWidth;
      final rHingeX = geometry.basePlateRect.right;
      final rMaxX = geometry.basePlateRect.right + geometry.flapWidth;

      expect(geometry.computeAngleFromDrag(FabricaFlap.right, Offset(rMaxX, 150)), closeTo(0.0, 0.01));
      expect(geometry.computeAngleFromDrag(FabricaFlap.right, Offset(rHingeX, 150)), closeTo(90.0, 0.01));
      expect(geometry.computeAngleFromDrag(FabricaFlap.right, Offset(rMinX, 150)), closeTo(180.0, 0.01));

      // Bottom flap
      final bMinY = geometry.basePlateRect.bottom - geometry.flapHeight;
      final bHingeY = geometry.basePlateRect.bottom;
      final bMaxY = geometry.basePlateRect.bottom + geometry.flapHeight;

      expect(geometry.computeAngleFromDrag(FabricaFlap.bottom, Offset(200, bMaxY)), closeTo(0.0, 0.01));
      expect(geometry.computeAngleFromDrag(FabricaFlap.bottom, Offset(200, bHingeY)), closeTo(90.0, 0.01));
      expect(geometry.computeAngleFromDrag(FabricaFlap.bottom, Offset(200, bMinY)), closeTo(180.0, 0.01));

      // Top flap
      final tMinY = geometry.basePlateRect.top - geometry.flapHeight;
      final tHingeY = geometry.basePlateRect.top;
      final tMaxY = geometry.basePlateRect.top + geometry.flapHeight;

      expect(geometry.computeAngleFromDrag(FabricaFlap.top, Offset(200, tMinY)), closeTo(0.0, 0.01));
      expect(geometry.computeAngleFromDrag(FabricaFlap.top, Offset(200, tHingeY)), closeTo(90.0, 0.01));
      expect(geometry.computeAngleFromDrag(FabricaFlap.top, Offset(200, tMaxY)), closeTo(180.0, 0.01));
    });
  });
}
