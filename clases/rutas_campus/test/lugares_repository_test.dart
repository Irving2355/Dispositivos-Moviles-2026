import 'package:flutter_test/flutter_test.dart';
import 'package:rutas_campus/data/lugares_repository.dart';

void main(){
  test('cargar devuelve una lista de lugares', () async {
    final repo = await LugaresRepository().cargar();

    expect(repo, isNotEmpty);
    expect(repo.length, 3);
    expect(repo.map((lugar) => lugar.id), containsAll(['b', 'c', 'd']));
  });
}