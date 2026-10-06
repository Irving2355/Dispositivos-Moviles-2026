import '../models/course.dart';
import '../services/course_service.dart';

class CourseRepository {
  final CourseService _service;

  CourseRepository({
    CourseService? service,
  }): _service = service ?? CourseService();

  Future<List<Course>> getCourses() async {
    return await _service.getCourses();
  }

  Future<Course> getCourse(int id) async {
    return await _service.getCourse(id);
  }

  Future<Course> createCourse(Course course) async {
    return await _service.createCourse(course);
  }

  Future<Course> updateCourse(Course course) async {
    return await _service.updateCourse(course);
  }

  Future<void> deleteCourse(int id) async {
    await _service.deleteCourse(id);
  }

  void dispose() {
    _service.dispose();
  }
}