import 'package:cas_natal_app_admin/API/entidades/appuser/appuser_model.dart';
import 'package:cas_natal_app_admin/API/http_client.dart'; 
import 'package:cas_natal_app_admin/API/entidades/appuser/appuser_repository.dart';
import 'package:cas_natal_app_admin/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Provider para o HttpClient
final httpClientProvider = Provider<IHttpClient>((ref) {
  return HttpClient();
});

// 2. Provider para o Repositório
final appUserRepositoryProvider = Provider((ref) {
  final client = ref.watch(httpClientProvider); 
  return AppUserRepository(client: client);
});

// 3. Provider do Controlador (Notifier)
final authControllerProvider = AsyncNotifierProvider<AuthController, AppUserModel?>(
  () => AuthController(),
);

class AuthController extends AsyncNotifier<AppUserModel?> {

  // O 'build' agora é 'async' e lê do secure storage
  @override
  Future<AppUserModel?> build() async {
    final storage = ref.read(storageServiceProvider);
    return await storage.getUser(); 
  }

  // Método de Login
  Future<void> login(String userName, String password) async {
    final repository = ref.read(appUserRepositoryProvider);
    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(
      () => repository.login(userName: userName, password: password),
    );

    // SE TIVER SUCESSO, SALVA O USUÁRIO
    if (state.hasValue && state.value != null) {
      await ref.read(storageServiceProvider).saveUser(state.value!);
    }
  }

  // Método de Registro
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

    // SE TIVER SUCESSO, SALVA O USUÁRIO
    if (state.hasValue && state.value != null) {
      await ref.read(storageServiceProvider).saveUser(state.value!);
    }
  }

  // MÉTODO DE LOGOUT (para usar no futuro)
  Future<void> logout() async {
    await ref.read(storageServiceProvider).deleteUser();
    state = const AsyncValue.data(null); // Define o estado como "logoff"
  }
}