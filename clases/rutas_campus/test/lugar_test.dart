import 'package:flutter_test/flutter_test.dart';
import 'package:rutas_campus/models/lugar.dart';

void main(){
  test('copyWith crea una copia; no altera el lugar original',(){
    const biblioteca = Lugar(
      id: 'b',
      nombre: 'Biblioteca',
      descripcion: 'Estudio',
      imagen: 'assets/images/biblioteca.jpg',
    );

    final copia = biblioteca.copyWith(
      favorito: true,
    );
    expect(copia.favorito, isFalse);
    expect(copia.nombre, equals('Biblioteca'));
    expect(copia.descripcion, equals('Estudio'));
    expect(copia.id, biblioteca.id);
  });
}