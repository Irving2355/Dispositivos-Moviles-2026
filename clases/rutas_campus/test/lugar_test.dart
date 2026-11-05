import 'package:flutter_test/flutter_test.dart';
import 'package:rutas_campus/models/lugar.dart';

void main(){
  test('copyWith crea una copia inmutable', (){
    const bibloteca = Lugar(
      id: 'b' , nombre: 'Bibloteca', descripcion: 'estudio', imagen: 'assets/images/bibloteca.png');
    
    final favorito = bibloteca.copyWith(favorito: true);

    expect(bibloteca.favorito, isFalse);
    expect(favorito.favorito, isTrue);
    expect(favorito.nombre, 'Bibloteca');
    expect(favorito.id, bibloteca.id);
  });
}