class Equipment {
  final String id;
  String name;
  String category;
  int total;
  int available;
  String location;

  Equipment({
    required this.id,
    required this.name,
    required this.category,
    required this.total,
    required this.available,
    required this.location,
  });

  factory Equipment.fromJson(Map<String, dynamic> map) {
    return Equipment(
      id: map['id'] as String,
      name: map['name'] as String,
      category: map['category'] as String,
      total: (map['total'] as num).toInt(),
      available: (map['available'] as num).toInt(),
      location: map['location'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'total': total,
        'available': available,
        'location': location,
      };
}
