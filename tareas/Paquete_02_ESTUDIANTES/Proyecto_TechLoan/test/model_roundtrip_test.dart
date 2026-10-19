import 'package:flutter_test/flutter_test.dart';
import 'package:techloan/data/sample_records.dart';
import 'package:techloan/models/equipment.dart';
import 'package:techloan/models/loan.dart';

void main() {
  test('Los identificadores de equipos del catálogo son distintos', () {
    final equipments = SampleRecords.equipments();
    expect(equipments.map((item) => item.id).toSet().length, equipments.length);
  });

  test('Se puede serializar y reconstruir un equipo', () {
    final original = SampleRecords.equipments().first;
    final rebuilt = Equipment.fromJson(original.toJson());
    expect(rebuilt.id, original.id);
    expect(rebuilt.total, original.total);
  });

  test('Se puede serializar y reconstruir un préstamo', () {
    final original = SampleRecords.loans().first;
    final rebuilt = Loan.fromJson(original.toJson());
    expect(rebuilt.id, original.id);
    expect(rebuilt.equipmentId, original.equipmentId);
  });
}
