import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nexasoft_incidencias/data/almacen_local.dart';
import 'package:nexasoft_incidencias/model/incidencia.dart';
import 'package:nexasoft_incidencias/services/gestor_incidencias.dart';
import 'package:nexasoft_incidencias/ui/pantalla_principal.dart';

// Almacén de prueba: conserva JSON entre gestores y permite simular un fallo.
class AlmacenPrueba implements AlmacenLocal {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  String contenido = File('assets/data/incidencias.json').readAsStringSync();
  bool fallar = false;

  @override
  Future<List<Incidencia>> leer() async => (jsonDecode(contenido) as List)
      .map((x) => Incidencia.desdeJson(x as Map<String, dynamic>))
      .toList();

  @override
  Future<void> guardar(List<Incidencia> lista) async {
    if (fallar) throw StateError('Fallo de escritura');
    contenido = jsonEncode(lista.map((x) => x.toJson()).toList());
  }
}

void main() {
  late AlmacenPrueba almacen;
  late GestorIncidencias g;
  setUp(() async {
    almacen = AlmacenPrueba();
    g = GestorIncidencias(almacen: almacen);
    await g.iniciar();
  });

  test('BUG-001 y BUG-003: estados persisten y los conteos siguen a los datos',
      () async {
    expect(g.contar('Pendiente'), 5);
    final otros = g.incidencias.skip(1).map((x) => x.toJson()).toList();
    for (final estado in ['Resuelta', 'Pendiente']) {
      await g.cambiarEstado('INC-101', estado);
      g = GestorIncidencias(almacen: almacen);
      await g.iniciar();
      expect(g.porId('INC-101')!.estado, estado);
      expect(g.contar('Pendiente'), estado == 'Resuelta' ? 4 : 5);
      expect(g.contar('Resuelta'), estado == 'Resuelta' ? 4 : 3);
      expect(g.contar('En proceso'), 2);
      expect(g.incidencias.skip(1).map((x) => x.toJson()).toList(), otros);
    }
    await expectLater(
        g.cambiarEstado('inexistente', 'Resuelta'), throwsArgumentError);
  });

  test('BUG-002: normaliza consulta y busca también en descripción', () {
    for (final texto in ['wifi', ' WiFi ']) {
      expect(g.buscar(texto).map((x) => x.id), ['INC-102']);
    }
    expect(g.buscar('TÚNEL').map((x) => x.id), ['INC-106']);
    expect(g.buscar('  ').map((x) => x.id), g.incidencias.map((x) => x.id));
  });

  test('FEAT-001: heredados, alta y edición conservan prioridad', () async {
    expect(g.incidencias.every((x) => x.prioridad == 'Media'), isTrue);
    await g.crear('Nuevo', 'Descripción', 'Cliente', 'Software',
        prioridad: 'Alta');
    final id = g.incidencias.first.id;
    g = GestorIncidencias(almacen: almacen);
    await g.iniciar();
    expect(g.porId(id)!.prioridad, 'Alta');
    expect(g.contar('Pendiente'), 6);
    await g.cambiarPrioridad(id, 'Baja');
    await g.iniciar();
    expect(g.porId(id)!.prioridad, 'Baja');
    expect(
        g.contar('Pendiente') + g.contar('En proceso') + g.contar('Resuelta'),
        11);
    await expectLater(g.cambiarPrioridad(id, 'Urgente'), throwsArgumentError);
    expect(g.porId(id)!.prioridad, 'Baja');
  });

  test('BUG-001 y FEAT-001: un fallo revierte estado, prioridad y alta',
      () async {
    almacen.fallar = true;
    await expectLater(g.cambiarEstado('INC-101', 'Resuelta'), throwsStateError);
    expect(g.porId('INC-101')!.estado, 'Pendiente');
    await expectLater(g.cambiarPrioridad('INC-101', 'Alta'), throwsStateError);
    expect(g.porId('INC-101')!.prioridad, 'Media');
    await expectLater(
        g.crear('Nuevo', 'Caso', 'Cliente', 'Redes'), throwsStateError);
    expect(g.incidencias.length, 10);
    expect(g.contar('Pendiente'), 5);
  });

  testWidgets('FEAT-002: filtros AND, vacío y limpiar sin alterar conteos',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: PantallaPrincipal(gestor: g)));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), ' WiFi ');
    await tester.pumpAndSettle();
    expect(find.text('1 registros'), findsOneWidget);
    await tester.tap(find.text('Todos'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('En proceso').last);
    await tester.pumpAndSettle();
    expect(find.text('1 registros'), findsOneWidget);
    await tester.tap(find.text('Todas'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Alta').last);
    await tester.pumpAndSettle();
    expect(find.text('No se encontraron incidencias'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    await tester.tap(find.text('Limpiar filtros'));
    await tester.pumpAndSettle();
    expect(find.text('10 registros'), findsOneWidget);
    expect(tester.widget<TextField>(find.byType(TextField)).controller!.text,
        isEmpty);
    expect(find.text('Todos'), findsOneWidget);
    expect(find.text('Todas'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
