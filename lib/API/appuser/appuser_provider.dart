import 'package:cas_natal_app_admin/API/appuser/appuser_model.dart';
import 'package:cas_natal_app_admin/API/appuser/appuser_repository.dart';
import 'package:cas_natal_app_admin/API/http_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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

@riverpod
Future<AppUserModel?> currentUser(Ref ref) async {
  final storage = ref.watch(secureStorageProvider);
  final token = await storage.read(key: 'token');
  if (token == null || token.isEmpty) return null;

  bool isExpired = JwtDecoder.isExpired(token);
  if (isExpired){
    await storage.deleteAll();
    return null;
  }

  Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  final name = decodedToken['name'] 
               ?? decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'] 
               ?? decodedToken['unique_name'] 
               ?? 'Usuário';
  final email = decodedToken['email'] 
                ?? decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress']
                ?? '';
  final userName = decodedToken['unique_name'] ?? '';

  return AppUserModel(
    id: decodedToken['jti'], 
    fullName: name,
    email: email,
    userName: userName,
    token: token, 
  );
}