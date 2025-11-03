import 'dart:convert';
import 'package:cas_natal_app_admin/API/entidades/enrollment/enrollment_model.dart';
import 'package:cas_natal_app_admin/API/http_client.dart';

class EnrollmentRepository {
  final IHttpClient client;
  EnrollmentRepository({required this.client});

  Future<List<EnrollmentModel>> getEnrollments() async {
    final response = await client.get(url: 'https://cas-natal-api.onrender.com/CASNatal/enrollments');
    try{
      final body = jsonDecode(response.body) as List;
      return body.map((item) => EnrollmentModel.fromMap(item)).toList();
    }catch(e){
      throw Exception(e);
    }
  }
}