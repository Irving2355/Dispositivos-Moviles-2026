import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/equipment.dart';
import '../models/loan.dart';

class LocalStore {
  static const String equipmentKey = 'techloan_equipments_v1';
  static const String loansKey = 'techloan_loans_v1';

  Future<List<Equipment>?> getEquipments() async {
    final preferences = await SharedPreferences.getInstance();
    final raw = preferences.getString(equipmentKey);
    if (raw == null) return null;
    final result = jsonDecode(raw) as List<dynamic>;
    return result.map((item) => Equipment.fromJson(item as Map<String, dynamic>)).toList();
  }

  Future<List<Loan>?> getLoans() async {
    final preferences = await SharedPreferences.getInstance();
    final raw = preferences.getString(loansKey);
    if (raw == null) return null;
    final result = jsonDecode(raw) as List<dynamic>;
    return result.map((item) => Loan.fromJson(item as Map<String, dynamic>)).toList();
  }

  Future<void> putEquipments(List<Equipment> equipments) async {
    final preferences = await SharedPreferences.getInstance();
    final payload = jsonEncode(equipments.map((e) => e.toJson()).toList());
    await preferences.setString(equipmentKey, payload);
  }

  Future<void> putLoans(List<Loan> loans) async {
    final preferences = await SharedPreferences.getInstance();
    final stored = loans.where((loan) => loan.notes.trim().isNotEmpty || loan.status == 'devuelto');
    await preferences.setString(loansKey, jsonEncode(stored.map((loan) => loan.toJson()).toList()));
  }
}
