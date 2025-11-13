import 'dart:convert';
import 'package:cas_natal_app_admin/API/entidades/appuser/appuser_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String _userStorageKey = 'appUser';

final secureStorageProvider = Provider((ref) {
  return const FlutterSecureStorage();
});

final storageServiceProvider = Provider<StorageService>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return StorageService(storage);
});

class StorageService {
  final FlutterSecureStorage _storage;
  StorageService(this._storage);

  Future<void> saveUser(AppUserModel user) async {
    try {
      final userMap = user.toMap();
      final userString = jsonEncode(userMap);
      await _storage.write(key: _userStorageKey, value: userString);
    } catch (e) {
      if (kDebugMode) {
        print("Erro ao salvar usuário no secure storage: $e");
      }
      rethrow;
    }
  }

  Future<AppUserModel?> getUser() async {
    try {
      final userString = await _storage.read(key: _userStorageKey);
      if (userString == null) {
        return null;
      }
      final userMap = jsonDecode(userString) as Map<String, dynamic>;
      return AppUserModel.fromMap(userMap);
    } catch (e) {
      if (kDebugMode) {
        print("Erro ao ler usuário do secure storage: $e");
      }
      await deleteUser();
      return null;
    }
  }

  Future<void> deleteUser() async {
    try {
      await _storage.delete(key: _userStorageKey);
    } catch (e) {
      if (kDebugMode) {
        print("Erro ao deletar usuário do secure storage: $e");
      }
      rethrow;
    }
  }
}