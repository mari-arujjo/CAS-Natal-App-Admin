import 'package:cas_natal_app_admin/Admin/Gestao%20Users/gestao_users_page.dart';
import 'package:cas_natal_app_admin/Admin/Gestao%20aula/gestao_aula_page.dart';
import 'package:cas_natal_app_admin/Admin/Gestao%20curso/gestao_curso_page.dart';
import 'package:cas_natal_app_admin/Admin/Gestao%20glossario/gestao_glossario_page.dart';
import 'package:cas_natal_app_admin/Admin/admin_page.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static final GoRouter rotas = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/admin',
    routes: [
      GoRoute(
        path: '/admin',
        name: 'Admin',
        builder: (context, state) {
          return AdminPage(key: state.pageKey);
         },
        routes: [
          GoRoute(
            path: '/gestaoUsers',
            name: 'GestaoUsers',
            builder: (context, state) {
              return GestaoUsersPage(key: state.pageKey);
            },
          ),
          GoRoute(
            path: '/gestaoCurso',
            name: 'GestaoCurso',
            builder: (context, state) {
              return GestaoCursoPage(key: state.pageKey);
            },
          ),
          GoRoute(
            path: '/gestaoAula',
            name: 'GestaoAula',
            builder: (context, state) {
              return GestaoAulaPage(key: state.pageKey);
            },
          ),
          GoRoute(
            path: '/gestaoGlossario',
            name: 'GestaoGlossario',
            builder: (context, state) {
              return GestaoGlossarioPage(key: state.pageKey);
            },
          ),
              
        ],
      ),
    ],
  );
}
