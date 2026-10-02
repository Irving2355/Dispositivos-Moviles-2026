import 'package:flutter/material.dart';
import '../../models/course.dart';
import '../widgets/course_card.dart';

class CourseListCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const CourseListCard({
    super.key,
    required this.course,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CourseCard(
      title: course.title,
      teacher: course.teacher,
      semester: course.semester,
      description: course.description,
      onViewDetails: onTap,
    );
  }
}
