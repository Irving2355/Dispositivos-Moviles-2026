import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:campus_cursos_grupo_a/main.dart';

void main() {
  testWidgets('home page renders without layout errors at responsive widths',
      (tester) async {
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    tester.view.devicePixelRatio = 1;

    for (final width in <double>[320, 375, 600, 768, 1024, 1440]) {
      tester.view.physicalSize = Size(width, 900);
      await tester.pumpWidget(const MyApp());
      await tester.pump();

      expect(find.text('Campus Cursos'), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'Failed at ${width}px');
    }
  });
}
