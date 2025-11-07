import 'package:cas_natal_app_admin/API/entidades/appuser/appuser_model.dart';
import 'package:cas_natal_app_admin/API/http_client.dart'; 
import 'package:cas_natal_app_admin/API/entidades/appuser/appuser_repository.dart';
import 'package:cas_natal_app_admin/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final httpClientProvider = Provider<IHttpClient>((ref) {
  return HttpClient();
});

final appUserRepositoryProvider = Provider((ref) {
  final client = ref.watch(httpClientProvider); 
  return AppUserRepository(client: client);
});

final authControllerProvider = AsyncNotifierProvider<AuthController, AppUserModel?>(
  () => AuthController(),
);

class AuthController extends AsyncNotifier<AppUserModel?> {
  @override
  Future<AppUserModel?> build() async {
    final storage = ref.read(storageServiceProvider);
    return await storage.getUser(); 
  }

  Future<void> login(String userName, String password) async {
    final repository = ref.read(appUserRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => repository.login(userName: userName, password: password),
    );

    if (state.hasValue && state.value != null) {
      await ref.read(storageServiceProvider).saveUser(state.value!);
    }
  }

  Future<void> register({
    required String fullName,
    required String userName,
    required String email,
    required String password,
  }) async {
    final repository = ref.read(appUserRepositoryProvider);
    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(
      () => repository.register(
        fullName: fullName,
        userName: userName,
        email: email,
        password: password,
      ),
    );
    if (state.hasValue && state.value != null) {
      await ref.read(storageServiceProvider).saveUser(state.value!);
    }
  }

  Future<void> logout() async {
    await ref.read(storageServiceProvider).deleteUser();
    state = const AsyncValue.data(null);
  }
}