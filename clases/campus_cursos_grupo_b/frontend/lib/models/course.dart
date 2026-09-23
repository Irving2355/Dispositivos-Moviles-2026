class Course {
  final int? id;
  final String name;
  final String description;
  final String teacher;
  final int semester;

  const Course({
    this.id,
    required this.name,
    required this.description,
    required this.teacher,
    required this.semester
  });

  factory Course.fromJson(
    Map<String, dynamic> json){
      return Course(
        id: json['id'] as int?,
        name: json['name'] as String,
        description: json['description'] as String,
        teacher: json['teacher'] as String,
        semester: json['semester'] as int,
        );
    }
  
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'description': description,
      'teacher': teacher,
      'semester': semester,
    };
  }

  Course copyWith({
    int? id,
    String? name,
    String? description,
    String? teacher,
    int? semester,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      teacher: teacher ?? this.teacher,
      semester: semester ?? this.semester,
    );
  }
}