import 'dart:convert';
import 'package:cas_natal_app_admin/API/entidades/appuser/appuser_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Chave para salvar o usuário no Secure Storage
const String _userStorageKey = 'appUser';

// Provider para o FlutterSecureStorage
final secureStorageProvider = Provider((ref) {
  return const FlutterSecureStorage();
});

// Provider para o nosso serviço de storage
final storageServiceProvider = Provider<StorageService>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return StorageService(storage);
});

class StorageService {
  final FlutterSecureStorage _storage;
  StorageService(this._storage);

  // Salva o usuário (convertido para JSON)
  Future<void> saveUser(AppUserModel user) async {
    try {
      final userMap = user.toMap();
      final userString = jsonEncode(userMap);
      await _storage.write(key: _userStorageKey, value: userString);
    } catch (e) {
      print("Erro ao salvar usuário no secure storage: $e");
    }
  }

  // Lê o usuário (convertido de JSON)
  Future<AppUserModel?> getUser() async {
    try {
      final userString = await _storage.read(key: _userStorageKey);
      if (userString == null) {
        return null;
      }
      final userMap = jsonDecode(userString) as Map<String, dynamic>;
      return AppUserModel.fromMap(userMap);
    } catch (e) {
      print("Erro ao ler usuário do secure storage: $e");
      await deleteUser(); // Limpa dados corrompidos
      return null;
    }
  }

  // Deleta o usuário (logout)
  Future<void> deleteUser() async {
    try {
      await _storage.delete(key: _userStorageKey);
    } catch (e) {
      print("Erro ao deletar usuário do secure storage: $e");
    }
  }
}