class Lugar {
  // Un modelo describe datos, pero no sabe dibujar widgets.
  final String id;
  final String nombre;
  final String descripcion;
  final String imagen;
  final bool favorito;

  const Lugar({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.imagen,
    this.favorito = false,
  });

  // Como los campos son final, creamos una copia cuando cambia un dato.
  // Asi evitamos modificar silenciosamente el objeto compartido.
  Lugar copyWith({bool? favorito}) {
    return Lugar(
      id: id,
      nombre: nombre,
      descripcion: descripcion,
      imagen: imagen,
      favorito: favorito ?? this.favorito,
    );
  }
}
