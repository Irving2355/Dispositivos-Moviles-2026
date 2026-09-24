import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:campus_cursos_grupo_c/main.dart';

void main() {
  for (final size in <Size>[
    const Size(320, 640),
    const Size(768, 1024),
    const Size(1440, 900),
  ]) {
    testWidgets('home renders without overflow at ${size.width}px',
        (tester) async {
      await tester.binding.setSurfaceSize(size);
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(const MyApp());
      await tester.pump();

      expect(find.text('Campus Cursos'), findsWidgets);
      expect(find.text('Ver cursos'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('course navigation and form remain available on mobile',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(320, 700));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const MyApp());
    await tester.ensureVisible(find.text('Ver cursos'));
    await tester.tap(find.text('Ver cursos'));
    await tester.pumpAndSettle();

    expect(find.text('Cursos disponibles'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.ensureVisible(find.text('Ver detalle'));
    await tester.tap(find.text('Ver detalle'));
    await tester.pumpAndSettle();

    expect(find.text('Detalle del curso'), findsOneWidget);
    expect(find.text('Editar'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.ensureVisible(find.text('Editar'));
    await tester.tap(find.text('Editar'));
    await tester.pumpAndSettle();

    expect(find.text('Crear / editar curso'), findsOneWidget);
    expect(find.text('Guardar'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
