class Course {
  final int? id;
  final String title;
  final String description;
  final String teacher;
  final String semester;

  const Course({
    this.id,
    required this.title,
    required this.description,
    required this.teacher,
    required this.semester,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: (json['id'] as num?)?.toInt(),
      title: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      teacher: json['teacher']?.toString() ?? '',
      semester: json['semester']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      // La API usa "name", aunque la interfaz lo presenta como "title".
      'name': title,
      'description': description,
      'teacher': teacher,
      'semester': semester,
    };
  }

  Course copyWith({
    int? id,
    String? title,
    String? description,
    String? teacher,
    String? semester,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      teacher: teacher ?? this.teacher,
      semester: semester ?? this.semester,
    );
  }
}
