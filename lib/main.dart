import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cas_natal_app_admin/cores.dart';
import 'package:cas_natal_app_admin/rotas.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AppWidget()
    )
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final cores = Cores();
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
      routerConfig: AppNavigation.rotas,
    );
  }
}
