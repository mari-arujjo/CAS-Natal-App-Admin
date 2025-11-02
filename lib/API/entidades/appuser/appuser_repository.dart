import 'dart:convert';

import 'package:cas_natal_app_admin/API/entidades/appuser/appuser_model.dart';
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

  Future<AppUserModel> register(AppUserModel user) async {
    final response = await client.post(
      url: 'https://cas-natal-api.onrender.com/CASNatal/account/register',
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(user.toMap()),
    );

    if (response.statusCode != 200 && response.statusCode != 201){
      final body = jsonDecode(response.body);
      if (body['errors'] != null){
        final erro = body['errors'] as Map<String, dynamic>;
        final key = erro.keys.first;
        final value = (erro[key] as List).first;
        final msg = 'Campo: $key \n($value)';
        throw Exception(msg);
      }
    }

    try{
      final body = jsonDecode(response.body);
      return AppUserModel.fromMap(body);
    }catch(e){
      throw Exception(e);
    }
  }

  Future<AppUserModel> login(AppUserModel user) async {
    final response = await client.post(
      url: 'https://cas-natal-api.onrender.com/CASNatal/account/login',
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(user.toMap()),
    );
    if (response.statusCode != 200 && response.statusCode != 201){
      final body = jsonDecode(response.body);
      if (body['errors'] != null){
        final erro = body['errors'] as Map<String, dynamic>;
        final key = erro.keys.first;
        final value = (erro[key] as List).first;
        final msg = 'Campo: $key \n($value)';
        throw Exception(msg);
      }
    }
    try{
      final body = jsonDecode(response.body);
      return AppUserModel.fromMap(body);
    }catch(e){
      throw Exception(e);
    }
  }


}