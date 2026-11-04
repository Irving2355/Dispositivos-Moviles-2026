import 'package:flutter_test/flutter_test.dart';
import 'package:rutas_campus/models/lugar.dart';

void main(){
  test('copyWith crea una copia no alterar el lugar', (){
    const bibloteca = Lugar(
      id: 'b', nombre: 'Bibloteca', descripcion: 'Estudio', imagen: 'assets/images/biblioteca.jpg', 
    );
    final favorito = bibloteca.copyWith(favorito: true);

    expect(favorito.id, 'b');
    expect(favorito.id, bibloteca.id);
    expect(favorito.nombre, 'Bibloteca');
    expect(favorito.favorito, isTrue);
    expect(bibloteca.favorito, isFalse);
  });
}