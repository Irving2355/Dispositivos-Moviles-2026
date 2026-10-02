import '../models/course.dart';
import '../services/course_service.dart';

class CourseRepository {
  final CourseService _service;

  CourseRepository({
    CourseService? service,
  }) : _service = service ?? CourseService();

  Future<List<Course>> getCourses() {
    return _service.getCourses();
  }

  Future<Course> getCourse(int id) {
    return _service.getCourse(id);
  }

  Future<void> createCourse(Course course) {
    return _service.createCourse(course);
  }

  Future<void> updateCourse(Course course) {
    return _service.updateCourse(course);
  }

  Future<void> deleteCourse(int id) {
    return _service.deleteCourse(id);
  }

  void dispose() {
    _service.dispose();
  }
}