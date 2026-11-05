import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rutas_campus/main.dart';

void main() {
  testWidgets('La pantalla carga datos y actualiza el alias', (tester) async {
    await tester.pumpWidget(const RutasCampusApp());
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Bienvenido al campus'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Ada');
    await tester.pump();
    expect(find.text('Hola, Ada'), findsOneWidget);

    // Avanza el reloj virtual para completar cargar() (1800 ms).
    await tester.pump(const Duration(milliseconds: 1900));
    await tester.pump(); // Reconstruye la pantalla tras el Future.
    expect(find.byType(ListTile), findsNWidgets(3));
    expect(find.text('Seleccion inicial: biblioteca'), findsOneWidget);

    // quitar el widget cancela el Timer en dispose().
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('El contador avanza un segundo y se libera al salir',
      (tester) async {
    await tester.pumpWidget(const RutasCampusApp());
    expect(find.text('0 s'), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    await tester.pump();
    expect(find.text('1 s'), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('Salir antes de terminar cargar() no causa errores',
      (tester) async {
    await tester.pumpWidget(const RutasCampusApp());
    await tester.tap(find.byIcon(Icons.exit_to_app));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 450));
    expect(find.text('Pantalla de pausa'), findsOneWidget);

    // La carga de InicioPage sigue pendiente; mounted evita setState.
    await tester.pump(const Duration(milliseconds: 1900));
    await tester.pump();
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });
}