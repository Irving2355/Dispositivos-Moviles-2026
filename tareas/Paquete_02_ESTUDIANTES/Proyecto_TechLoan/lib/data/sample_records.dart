import '../models/equipment.dart';
import '../models/loan.dart';

class SampleRecords {
  static List<Equipment> equipments() => [
        Equipment(id: 'EQ-104', name: 'Router Cisco 2900', category: 'Redes', total: 1, available: 0, location: 'Laboratorio 3'),
        Equipment(id: 'EQ-102', name: 'Proyector Epson X39', category: 'Proyección', total: 2, available: 1, location: 'Almacén A'),
        Equipment(id: 'EQ-108', name: 'Adaptador HDMI USB-C', category: 'Accesorios', total: 8, available: 8, location: 'Almacén B'),
        Equipment(id: 'EQ-101', name: 'Laptop Lenovo ThinkPad', category: 'Computación', total: 3, available: 2, location: 'Almacén A'),
        Equipment(id: 'EQ-106', name: 'Cámara Logitech', category: 'Accesorios', total: 3, available: 3, location: 'Laboratorio 1'),
        Equipment(id: 'EQ-103', name: 'Tableta Samsung A9', category: 'Tabletas', total: 4, available: 3, location: 'Almacén B'),
        Equipment(id: 'EQ-107', name: 'Mini PC Intel NUC', category: 'Computación', total: 2, available: 1, location: 'Laboratorio 2'),
        Equipment(id: 'EQ-105', name: 'Monitor Dell 24', category: 'Computación', total: 4, available: 4, location: 'Laboratorio 1'),
      ];

  static List<Loan> loans() {
    final now = DateTime.now();
    return [
      Loan(id: 'PR-1005', equipmentId: 'EQ-107', borrower: 'Sofía Hernández', createdAt: now.subtract(const Duration(days: 8)), dueAt: now.add(const Duration(days: 2)), status: 'activo', notes: 'Proyecto de laboratorio'),
      Loan(id: 'PR-1004', equipmentId: 'EQ-104', borrower: 'Mario Salas', createdAt: now.subtract(const Duration(days: 14)), dueAt: now.subtract(const Duration(days: 3)), status: 'activo', notes: 'Práctica de redes'),
      Loan(id: 'PR-1003', equipmentId: 'EQ-103', borrower: 'Lucía Ramírez', createdAt: now.subtract(const Duration(days: 5)), dueAt: now.add(const Duration(days: 5)), status: 'activo', notes: 'Captura de datos'),
      Loan(id: 'PR-1002', equipmentId: 'EQ-102', borrower: 'Ernesto Núñez', createdAt: now.subtract(const Duration(days: 11)), dueAt: now.subtract(const Duration(days: 1)), status: 'activo', notes: 'Presentación externa'),
      Loan(id: 'PR-1001', equipmentId: 'EQ-101', borrower: 'Ana Pérez', createdAt: now.subtract(const Duration(days: 3)), dueAt: now.add(const Duration(days: 4)), status: 'activo', notes: 'Taller'),
      Loan(id: 'PR-0999', equipmentId: 'EQ-106', borrower: 'Pablo Martínez', createdAt: now.subtract(const Duration(days: 20)), dueAt: now.subtract(const Duration(days: 13)), status: 'devuelto', returnedAt: now.subtract(const Duration(days: 14)), notes: 'Videoconferencia'),
    ];
  }
}
