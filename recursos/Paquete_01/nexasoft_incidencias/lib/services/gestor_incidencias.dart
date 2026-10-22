import '../data/almacen_local.dart';
import '../model/incidencia.dart';

class GestorIncidencias {
  final AlmacenLocal datos;
  GestorIncidencias({AlmacenLocal? almacen})
      : datos = almacen ?? AlmacenLocal();
  List<Incidencia> incidencias = [];
  // BUG-003: se comenta la caché; los conteos se calculan con los datos actuales.
  // int cantidadPendientes = 0;

  Future<void> iniciar() async {
    incidencias = await datos.leer();
    // BUG-003: ya no se guarda un conteo que puede quedar obsoleto.
    // cantidadPendientes = incidencias.where((x) => x.estado == 'Pendiente').length;
  }

  List<Incidencia> buscar(String texto) {
    if (texto.trim().isEmpty) return incidencias;
    // BUG-002: se comenta la búsqueda limitada al título y sensible a mayúsculas.
    // return incidencias.where((x) => x.titulo.contains(texto)).toList();
    final consulta = texto.trim().toLowerCase();
    return incidencias
        .where((x) =>
            x.titulo.toLowerCase().contains(consulta) ||
            x.descripcion.toLowerCase().contains(consulta))
        .toList();
  }

  Incidencia? porId(String id) {
    for (var x in incidencias) {
      if (x.id == id) return x;
    }
    return null;
  }

  int contar(String estado) {
    // BUG-003: se comenta el retorno obsoleto; todos los estados se cuentan igual.
    // if (estado == 'Pendiente') return cantidadPendientes;
    return incidencias.where((x) => x.estado == estado).length;
  }

  Future<void> cambiarEstado(String id, String estado) async {
    // BUG-001: se valida el ID y se espera el guardado antes de comunicar éxito.
    final item = porId(id);
    if (item == null) throw ArgumentError('Incidencia no encontrada: $id');
    if (!['Pendiente', 'En proceso', 'Resuelta'].contains(estado)) {
      throw ArgumentError('Estado no válido: $estado');
    }
    final anterior = item.estado;
    item.estado = estado;
    try {
      await datos.guardar(incidencias);
    } catch (_) {
      // BUG-001: si falla el guardado, se recupera el estado anterior.
      item.estado = anterior;
      rethrow;
    }
  }

  Future<void> cambiarPrioridad(String id, String prioridad) async {
    // FEAT-001: se valida la prioridad en el modelo y se persiste la edición.
    final item = porId(id);
    if (item == null) throw ArgumentError('Incidencia no encontrada: $id');
    final anterior = item.prioridad;
    item.prioridad = prioridad;
    try {
      await datos.guardar(incidencias);
    } catch (_) {
      item.prioridad = anterior;
      rethrow;
    }
  }

  Future<void> crear(
      String titulo, String descripcion, String cliente, String categoria,
      {String prioridad = 'Media'}) async {
    final nuevo = Incidencia(
      id: 'INC-${DateTime.now().microsecondsSinceEpoch}',
      titulo: titulo,
      descripcion: descripcion,
      cliente: cliente,
      categoria: categoria,
      prioridad: prioridad, // FEAT-001: prioridad elegida al registrar.
      estado: 'Pendiente',
      fecha: DateTime.now().toIso8601String().split('T').first,
    );
    incidencias.insert(0, nuevo);
    // BUG-003: se comenta el incremento; contar() usa la lista actual.
    // cantidadPendientes++;
    try {
      await datos.guardar(incidencias);
    } catch (_) {
      // BUG-001: un alta fallida tampoco debe quedar como guardada en memoria.
      incidencias.remove(nuevo);
      rethrow;
    }
  }

  Future<void> reiniciarDemo() async {
    await datos.restaurarDatosDeEjemplo();
    await iniciar();
  }
}
