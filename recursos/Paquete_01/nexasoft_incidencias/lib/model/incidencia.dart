class Incidencia {
  String id;
  String titulo;
  String descripcion;
  String cliente;
  String categoria;
  String estado;
  String fecha;
  // FEAT-001: se agrega prioridad y se aceptan solamente estos tres valores.
  static const prioridades = ['Baja', 'Media', 'Alta'];
  String _prioridad = 'Media';
  String get prioridad => _prioridad;
  set prioridad(String valor) {
    if (!prioridades.contains(valor)) {
      throw ArgumentError('Prioridad no válida: $valor');
    }
    _prioridad = valor;
  }

  Incidencia({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.cliente,
    required this.categoria,
    required this.estado,
    required this.fecha,
    String prioridad = 'Media',
  }) {
    this.prioridad = prioridad;
  }

  factory Incidencia.desdeJson(Map<String, dynamic> m) {
    return Incidencia(
      id: m['id']?.toString() ?? '',
      titulo: m['titulo']?.toString() ?? '',
      descripcion: m['descripcion']?.toString() ?? '',
      cliente: m['cliente']?.toString() ?? '',
      categoria: m['categoria']?.toString() ?? 'Software',
      estado: m['estado']?.toString() ?? 'Pendiente',
      fecha: m['fecha']?.toString() ?? '',
      // FEAT-001: los registros heredados reciben Media sin modificar assets.
      prioridad: prioridades.contains(m['prioridad'])
          ? m['prioridad'] as String
          : 'Media',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'cliente': cliente,
      'categoria': categoria,
      'estado': estado,
      'fecha': fecha,
      'prioridad': prioridad, // FEAT-001: también se guarda en el JSON.
    };
  }
}
