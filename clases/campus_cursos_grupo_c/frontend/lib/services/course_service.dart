import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/course.dart';

class ApiException implements Exception{
  final String message;
  final int? statusCode;

  const ApiException(
    this.message,{
      this.statusCode,
    }
  );

  @override
  String toString() {
    // TODO: implement toString
    return message;
  }
}

class CourseService {
  final http.Client _client;

  CourseService({
    http.Client? client,
  }): _client = client ?? http.Client();

  Uri _uri(String path,){
    return Uri.parse(
      '${ApiConfig.baseUrl}$path',
    );
  }

  Future<List<Course>> getCourses() async{
    final response = await _client.get(_uri('/courses'),);

    if(response.statusCode != 200){
      throw ApiException(
        'No se pudo',
        statusCode: response.statusCode,
      );
    }

    final decoded = jsonDecode(
      response.body,
    ) as List<dynamic>;

    return decoded.map(
      (item)=>
      Course.fromJson(
        item as Map<String, dynamic>,
      ),
    ).toList();
  }

  Future<Course> getCourse(int id) async{
    final response = await _client.get(_uri('/courses/$id'),);

    if(response.statusCode != 200){
      throw ApiException(
        'No se pudo',
        statusCode: response.statusCode,
      );
    }

    final decoded = jsonDecode(
      response.body,
    ) as Map<String, dynamic>;

    return Course.fromJson(decoded,);
  }

  Future<Course> createCourse(Course course)async{
    final response = 
    await _client.post(
      _uri('/courses'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        course.toJson(),
      ),
    );

    if(response.statusCode != 201){
      throw ApiException(
        'No se pudo',
        statusCode: response.statusCode,
      );
    }

    return Course.fromJson(
      jsonDecode(
        response.body,
      )as Map<String, dynamic>,
    );
  }

  Future<Course> updateCourse(Course course)async{
    if(course.id == null){
      throw const ApiException(
        'No existe id'
      );
    }

    final response = await _client.put(
      _uri('courses/${course.id}'),
      headers: {
        'Content-Type': 'application/json'
      },
      body: jsonEncode(course.toJson())
    );

    if(response.statusCode != 200){
      throw ApiException(
        'No se pudo',
        statusCode: response.statusCode,
      );
    }

    return Course.fromJson(
      jsonDecode(response.body)as Map<String, dynamic>,
    );
  }

  Future<void> deleteCourse(int id)async{
    final response = await _client.delete(
      _uri('courses/$id')
    );

    if(response.statusCode != 204){
      throw ApiException(
        'No se pudo',
        statusCode: response.statusCode,
      );
    }
  }

  void dispose(){
    _client.close();
  }
}