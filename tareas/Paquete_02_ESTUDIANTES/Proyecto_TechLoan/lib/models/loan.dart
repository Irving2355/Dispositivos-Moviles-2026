class Loan {
  final String id;
  final String equipmentId;
  final String borrower;
  final DateTime createdAt;
  final DateTime dueAt;
  String status;
  DateTime? returnedAt;
  final String notes;

  Loan({
    required this.id,
    required this.equipmentId,
    required this.borrower,
    required this.createdAt,
    required this.dueAt,
    required this.status,
    required this.notes,
    this.returnedAt,
  });

  bool get isActive => status == 'activo';

  factory Loan.fromJson(Map<String, dynamic> map) {
    return Loan(
      id: map['id'] as String,
      equipmentId: map['equipmentId'] as String,
      borrower: map['borrower'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      dueAt: DateTime.parse(map['dueAt'] as String),
      status: map['status'] as String,
      notes: map['notes'] as String? ?? '',
      returnedAt: map['returnedAt'] == null
          ? null
          : DateTime.parse(map['returnedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'equipmentId': equipmentId,
        'borrower': borrower,
        'createdAt': createdAt.toIso8601String(),
        'dueAt': dueAt.toIso8601String(),
        'status': status,
        'notes': notes,
        'returnedAt': returnedAt?.toIso8601String(),
      };
}
