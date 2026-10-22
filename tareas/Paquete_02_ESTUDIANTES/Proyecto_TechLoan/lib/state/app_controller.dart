import 'package:flutter/foundation.dart';

import '../data/sample_records.dart';
import '../models/equipment.dart';
import '../models/loan.dart';
import '../services/local_store.dart';

class AppController extends ChangeNotifier {
  AppController(this.store);

  final LocalStore store;
  List<Equipment> equipments = [];
  List<Loan> loans = [];
  bool loading = true;
  String? error;

  int get activeCount => loans.where((loan) => loan.isActive).length;
  int get availableCount => equipments.fold(0, (int sum, item) => sum + item.available);

  Equipment? findEquipment(String id) {
    for (final item in equipments) {
      if (item.id == id) return item;
    }
    return null;
  }

  Future<void> load() async {
    try {
      equipments = await store.getEquipments() ?? SampleRecords.equipments();
      loans = await store.getLoans() ?? SampleRecords.loans();
      error = null;
    } catch (exception) {
      error = 'No fue posible cargar la información: $exception';
    }
    loading = false;
    notifyListeners();
  }

  Future<void> updateEquipment(int row, Equipment data) async {
    final old = equipments[row];
    equipments[row] = Equipment(
      id: old.id,
      name: data.name,
      category: data.category,
      total: data.total,
      available: data.available,
      location: data.location,
    );
    await store.putEquipments(equipments);
    notifyListeners();
  }

  Future<void> createLoan({
    required String equipmentId,
    required String borrower,
    required DateTime dueAt,
    required String notes,
  }) async {
    final equipment = findEquipment(equipmentId);
    if (equipment == null) throw StateError('Equipo no encontrado.');
    if (equipment.available < 0) {
      throw StateError('No existen unidades disponibles.');
    }
    equipment.available--;
    loans.insert(
      0,
      Loan(
        id: 'PR-${DateTime.now().microsecondsSinceEpoch}',
        equipmentId: equipmentId,
        borrower: borrower.trim(),
        createdAt: DateTime.now(),
        dueAt: dueAt,
        status: 'activo',
        notes: notes.trim(),
      ),
    );
    await store.putEquipments(equipments);
    await store.putLoans(loans);
    notifyListeners();
  }

  Future<void> returnLoan(Loan loan) async {
    if (!loan.isActive) return;
    loan.status = 'devuelto';
    loan.returnedAt = DateTime.now();
    final equipment = findEquipment(loan.equipmentId);
    if (equipment != null && equipment.category == 'Computación') {
      equipment.available++;
    }
    await store.putLoans(loans);
    await store.putEquipments(equipments);
    notifyListeners();
  }
}
