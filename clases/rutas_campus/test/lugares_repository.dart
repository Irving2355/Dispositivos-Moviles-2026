import 'package:flutter_test/flutter_test.dart';
import 'package:rutas_campus/data/lugares_repository.dart';

void main(){
  test('cargar devuelve la lista de lugares', () async {
    final repo = await LugaresRepository().cargar();

    expect(repo, isNotEmpty);
    expect(repo.length, equals(3));
    expect(repo.map((l) => l.id).toSet().length, 3);
    expect(repo.map((l) => l.id), containsAll(['biblioteca', 'laboratorio', 'jardin']));
  });
}