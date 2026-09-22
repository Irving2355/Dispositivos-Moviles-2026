import 'package:campus_cursos_grupo_b/main.dart';
import 'package:campus_cursos_grupo_b/pages/course_detail_page/course_detail_page_widget.dart';
import 'package:campus_cursos_grupo_b/pages/course_form_page/course_form_page_widget.dart';
import 'package:campus_cursos_grupo_b/pages/courses_page/courses_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('home adapts to representative viewport widths', (tester) async {
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    tester.view.devicePixelRatio = 1;

    for (final width in [320.0, 375.0, 600.0, 768.0, 1024.0, 1440.0]) {
      tester.view.physicalSize = Size(width, 900);
      await tester.pumpWidget(const MyApp());
      await tester.pump();

      expect(find.text('Campus Cursos'), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'viewport width: $width');
    }
  });

  testWidgets('content pages do not overflow on a 320 px viewport',
      (tester) async {
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(320, 900);

    final pages = <Widget>[
      const CoursesPageWidget(),
      const CourseDetailPageWidget(courseId: 0),
      const CourseFormPageWidget(courseId: 0),
    ];

    for (final page in pages) {
      await tester.pumpWidget(MaterialApp(home: page));
      await tester.pump();
      expect(tester.takeException(), isNull,
          reason: page.runtimeType.toString());
    }
  });

  testWidgets('home navigation still opens the courses page', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Ver cursos'));
    await tester.pumpAndSettle();

    expect(find.text('Agregar curso'), findsOneWidget);
    expect(find.text('Ver detalles'), findsOneWidget);
  });
}
