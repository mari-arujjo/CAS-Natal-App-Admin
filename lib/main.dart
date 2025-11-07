import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cas_natal_app_admin/cores.dart';
import 'package:cas_natal_app_admin/rotas.dart'; // Importa o NOVO provider de rotas

Future<void> main() async {
  // Garante que o Flutter esteja inicializado
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    const ProviderScope(
      // Não precisamos mais do 'overrides'
      child: AppWidget()
    )
  );
}

class AppWidget extends ConsumerWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cores = Cores();

    // Assista ao goRouterProvider
    final router = ref.watch(goRouterProvider); 

    return MaterialApp.router(
      title: 'CAS Natal + IFRN ADMIN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          foregroundColor: cores.preto,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: cores.preto,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: cores.preto),
          bodyMedium: TextStyle(color: cores.preto),
          bodySmall: TextStyle(color: cores.preto),
        ),
      ),
      // Use o provider no routerConfig
      routerConfig: router,
    );
  }
}