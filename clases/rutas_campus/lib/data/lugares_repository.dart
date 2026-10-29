import '../models/lugar.dart';

class LugaresRepository {
  // Simulamos una lectura asincrona. NO es una API ni persistencia real.
  // La espera permite estudiar que pasa si se cierra la pantalla antes.
  Future<List<Lugar>> cargar() async {
    await Future<void>.delayed(const Duration(milliseconds: 1800));

    return const [
      Lugar(
        id: 'biblioteca',
        nombre: 'Biblioteca',
        descripcion: 'Un espacio para investigar y estudiar.',
        imagen: 'assets/images/biblioteca.png',
      ),
      Lugar(
        id: 'laboratorio',
        nombre: 'Laboratorio',
        descripcion: 'Equipos y proyectos de tecnologia.',
        imagen: 'assets/images/laboratorio.png',
      ),
      Lugar(
        id: 'jardin',
        nombre: 'Jardin central',
        descripcion: 'Un lugar para descansar entre clases.',
        imagen: 'assets/images/jardin.png',
      ),
    ];
  }
}
