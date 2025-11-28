import 'dart:convert';
import 'package:cas_natal_app_admin/API/appuser/appuser_model.dart';
import 'package:cas_natal_app_admin/API/http_client.dart';

class AppUserRepository {
  final IHttpClient client;
  AppUserRepository({required this.client});

  Future<List<AppUserModel>> getUsers() async {
    final response = await client.get(url: 'https://cas-natal-api.onrender.com/CASNatal/account/users');
    try{
      final body = jsonDecode(response.body) as List;
      return body.map((item) => AppUserModel.fromMap(item)).toList();
    }catch(e){
      throw Exception(e);
    }
  }

  Future<AppUserModel> register({required String fullName, required String userName, required String email, required String password}) async {
    final Map<String, dynamic> requestBody ={
      'Name': fullName,
      'username': userName,
      'email': email,
      'password': password,
    };

    final response = await client.post(
      url: 'https://cas-natal-api.onrender.com/CASNatal/account/register',
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode != 200 && response.statusCode != 201){
      final body = jsonDecode(response.body);
      if (body['errors'] != null){
        final erro = body['errors'] as Map<String, dynamic>;
        final key = erro.keys.first;
        final value = (erro[key] as List).first;
        final msg = '$value';
        throw msg;
      }
    }

    try{
      final body = jsonDecode(response.body);
      return AppUserModel.fromMap(body);
    }catch(e){
      throw Exception(e);
    }
  }

  Future<AppUserModel> login({ required String userName, required String password}) async {
    final Map<String, dynamic> requestBody ={
      'username': userName,
      'password': password,
    };

    final response = await client.post(
      url: 'https://cas-natal-api.onrender.com/CASNatal/account/login',
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 401) throw response.body; 
    
    if (response.statusCode != 200 ){
      final body = jsonDecode(response.body);
      if (body['errors'] != null){
        final erro = body['errors'] as Map<String, dynamic>;
        final key = erro.keys.first;
        final value = (erro[key] as List).first;
        final msg = 'Campo: $key \n($value)';
        throw msg;
      }
      throw Exception('Erro desconhecido no login.');
    }
    try{
      final body = jsonDecode(response.body);
      return AppUserModel.fromMap(body);
    }catch(e){
      throw Exception(e);
    }
  }

   Future<AppUserModel> update({
    required String token,
    String? fullName,
    String? userName,
    String? email,
    bool? active,
   }) async {
    final response = await client.update(
      url: 'https://cas-natal-api.onrender.com/CASNatal/account/update',
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(),
    );

    if (response.statusCode == 401) throw response.body; 
    
    if (response.statusCode != 200 ){
      final body = jsonDecode(response.body);
      if (body['errors'] != null){
        final erro = body['errors'] as Map<String, dynamic>;
        final key = erro.keys.first;
        final value = (erro[key] as List).first;
        final msg = 'Campo: $key \n($value)';
        throw msg;
      }
      throw Exception('Erro desconhecido no login.');
    }
    try{
      final body = jsonDecode(response.body);
      return AppUserModel.fromMap(body);
    }catch(e){
      throw Exception(e);
    }
  }


}