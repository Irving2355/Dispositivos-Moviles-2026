import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/course.dart';

class ApiExeption implements Exception{
  final String message;
  final int? statusCode;

  const ApiExeption(
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

  Future<List<Course>> getCourses()async{
    final response = await _client.get(_uri(
      '/courses',
    ));

    if(response.statusCode != 200){
      throw ApiExeption('No se obtuvo respuesta',
      statusCode:  response.statusCode);
    }

    final decoded = jsonDecode(response.body,
    )as List<dynamic>;

    return decoded.map(
      (item)=>
      Course.fromJson(item as Map<String, dynamic>,),
    ).toList();
  }

  //id
  Future<Course> getCourse(int id,)async{
    final response = await _client.get(
      _uri(
      '/courses/%id',
    ),);

    if(response.statusCode != 200){
      throw ApiExeption('No se obtuvo respuesta',
      statusCode:  response.statusCode);
    }

    final decoded = jsonDecode(response.body,
    )as Map<String, dynamic>;

    return Course.fromJson(decoded);
  }

  Future<Course> createCourse(Course course)
  async{
    final response = await _client.post(
      _uri('/courses'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(course.toJson()),
    );

    if(response.statusCode != 201){
      throw ApiExeption('No se pudo crear el curso',
      statusCode:  response.statusCode);
    }

    return Course.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  Future<Course> updateCourse(Course course)
  async{
    if(course.id == null){
      throw ApiExeption('El curso no tiene id');
    }

    final response = await _client.put(
      _uri('/courses/${course.id}'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(course.toJson()),
    );

    if(response.statusCode != 200){
      throw ApiExeption('No se pudo actualizar el curso',
      statusCode:  response.statusCode);
    }

    return Course.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  Future<void> deleteCourse(int id)async{
    final response = await _client.delete(
      _uri('/courses/$id'),
    );

    if(response.statusCode != 204){
      throw ApiExeption('No se pudo eliminar el curso',
      statusCode:  response.statusCode);
    }
  }

  String _extractError(
    http.Response response
  ){
    try {
      final data = jsonDecode(
        response.body,
      ) as Map<String, dynamic>;

      return data['message']?.toString() ?? 'Error del server';
    } catch (_) {
      return 'Error del server';
    }
  }

  void dispose(){
    _client.close();
  }
}