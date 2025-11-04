import 'package:cas_natal_app_admin/API/entidades/appuser/appuser_model.dart';
import 'package:cas_natal_app_admin/API/entidades/appuser/appuser_repository.dart';
import 'package:cas_natal_app_admin/API/http_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appuser_provider.g.dart'; 

@riverpod
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage();
}

@riverpod
IHttpClient httpClient(Ref ref){
  return HttpClient();
}

@riverpod 
AppUserRepository userRepository(Ref ref){
  final client = ref.watch(httpClientProvider);
  return AppUserRepository(client: client);
}

@riverpod
class AppUserNotifier extends _$AppUserNotifier{
  @override
  Future<List<AppUserModel>> build() async{
    final repository = ref.read(userRepositoryProvider);
    return repository.getUsers();
  }
}