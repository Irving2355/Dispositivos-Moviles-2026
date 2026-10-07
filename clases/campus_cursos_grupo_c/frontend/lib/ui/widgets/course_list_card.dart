import 'package:flutter/material.dart';
import '../../models/course.dart';
import 'course_card.dart';

class CourseListCard extends StatelessWidget {
  final Course course;
  final VoidCallback onViewDetails;

  const CourseListCard({
    super.key,
    required this.course,
    required this.onViewDetails
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CourseCard(
      title: course.name, 
      description: course.description, 
      teacher: 'Profesor: ${course.teacher}', 
      semester: 'Semestre: ${course.semester}', 
      onViewDetails: onViewDetails
    );
  }
}