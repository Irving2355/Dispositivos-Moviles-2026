import 'package:flutter_test/flutter_test.dart';
import 'package:rutas_campus/data/lugares_repository.dart';
import 'package:rutas_campus/models/lugar.dart';

void main(){
  test('cargar los lugares', () async{
    final datos = await LugaresRepository().cargar();

    expect(datos.length, 3);
    expect(datos.map((l) => l.id).toSet().length, 3);
    expect(datos.first.nombre, 'Bibloteca');

    expect(datos.contains( Lugar(
      id: 'b' , nombre: 'Bibloteca', descripcion: 'estudio', imagen: 'assets/images/bibloteca.png')), isTrue);
      
  });
}