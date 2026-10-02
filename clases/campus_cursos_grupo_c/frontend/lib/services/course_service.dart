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
}