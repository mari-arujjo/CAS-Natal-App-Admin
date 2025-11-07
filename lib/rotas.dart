import 'package:cas_natal_app_admin/API/entidades/course/course_model.dart';
import 'package:cas_natal_app_admin/API/entidades/lesson/lesson_model.dart';
import 'package:cas_natal_app_admin/API/providers/auth_provider.dart';
import 'package:cas_natal_app_admin/pages/Admin/Gestao%20Users/gestao_users_page.dart';
import 'package:cas_natal_app_admin/pages/Admin/Gestao%20aula/aula_page.dart';
import 'package:cas_natal_app_admin/pages/Admin/Gestao%20aula/cadastro_aula_page.dart';
import 'package:cas_natal_app_admin/pages/Admin/Gestao%20aula/gestao_aula_page.dart';
import 'package:cas_natal_app_admin/pages/Admin/Gestao%20curso/cadastro_curso_page.dart';
import 'package:cas_natal_app_admin/pages/Admin/Gestao%20curso/curso_page.dart';
import 'package:cas_natal_app_admin/pages/Admin/Gestao%20curso/gestao_curso_page.dart';
import 'package:cas_natal_app_admin/pages/Admin/Gestao%20glossario/cadastro_glossario_page.dart';
import 'package:cas_natal_app_admin/pages/Admin/Gestao%20glossario/gestao_glossario_page.dart';
import 'package:cas_natal_app_admin/pages/Admin/Gestao%20glossario/glossario_page.dart';
import 'package:cas_natal_app_admin/pages/Admin/Gestao%20users/cadastrar_user_page.dart';
import 'package:cas_natal_app_admin/pages/Admin/Gestao%20users/user_page.dart';
import 'package:cas_natal_app_admin/pages/Admin/admin_page.dart';
import 'package:cas_natal_app_admin/pages/Configuracoes/config_page.dart';
import 'package:cas_natal_app_admin/pages/Configuracoes/editar_perfil_page.dart';
import 'package:cas_natal_app_admin/pages/Configuracoes/senha_page.dart';
import 'package:cas_natal_app_admin/pages/Estatisticas/estatistica_page.dart';
import 'package:cas_natal_app_admin/nav.dart';
import 'package:cas_natal_app_admin/pages/login_cadastro_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorGestao = GlobalKey<NavigatorState>(debugLabel: 'shellGestao');
final _rootNavigatorEstatistica = GlobalKey<NavigatorState>(debugLabel: 'shellEstatistica');
final _rootNavigatorConfiguracoes = GlobalKey<NavigatorState>(debugLabel: 'shellConfiguracoes');

final goRouterProvider = Provider<GoRouter>((ref) {
  
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/admin',
    navigatorKey: _rootNavigatorKey,

    redirect: (BuildContext context, GoRouterState state) {
      /*final isLoggedIn = authState.hasValue && authState.value != null;
      final isGoingToLogin = state.matchedLocation == '/login';
      if (!isLoggedIn && !isGoingToLogin) {
        return '/login';
      }
      if (isLoggedIn && isGoingToLogin) {
        return '/admin';
      }
      */return null;
    },

    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavigationBarWidget(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          // BRANCH -> GESTAO
          StatefulShellBranch(
            navigatorKey: _rootNavigatorGestao,
            routes: [
              GoRoute(
                path: '/admin',
                name: 'Admin',
                builder: (context, state) {
                  return AdminPage(key: state.pageKey);
                },
                routes: [
                  GoRoute(
                    path: 'gestaoUsers',
                    name: 'GestaoUsers',
                    builder: (context, state) {
                      return GestaoUsersPage(key: state.pageKey);
                    },
                    routes: [
                      GoRoute(
                        path: 'cadastroUser',
                        name: 'CadastroUser',
                        builder: (context, state) {
                          return CadastrarUserPage(key: state.pageKey);
                        },
                      ),
                      GoRoute(
                        path: 'alterarUser',
                        name: 'AlterarUser',
                        builder: (context, state) {
                          return UserPage(key: state.pageKey);
                        },
                      )
                    ]
                  ),
                  GoRoute(
                    path: 'gestaoCurso',
                    name: 'GestaoCurso',
                    builder: (context, state) {
                      return GestaoCursoPage(key: state.pageKey);
                    },
                    routes: [
                      GoRoute(
                        path: 'cadastroCurso',
                        name: 'CadastroCurso',
                        builder: (context, state) {
                          return CadastroCursoPage(key: state.pageKey);
                        },
                      ),
                      GoRoute(
                        path: 'alterarCurso',
                        name: 'AlterarCurso',
                        builder: (context, state) {
                          final curso = state.extra as CourseModel;
                          return CursoPage(key: state.pageKey, curso: curso);
                        },
                      ),
                    ]
                  ),
                  GoRoute(
                    path: 'gestaoAula',
                    name: 'GestaoAula',
                    builder: (context, state) {
                      return GestaoAulaPage(key: state.pageKey);
                    },
                    routes: [
                      GoRoute(
                        path: 'cadastroAula',
                        name: 'CadastroAula',
                        builder: (context, state) {
                          return CadastroAulaPage(key: state.pageKey);
                        },
                      ),
                      GoRoute(
                        path: 'alterarAula',
                        name: 'AlterarAula',
                        builder: (context, state) {
                          final aula = state.extra as LessonModel;
                          return AulaPage(key: state.pageKey, aula: aula);
                        },
                      ),
                    ]
                  ),
                  GoRoute(
                    path: 'gestaoGlossario',
                    name: 'GestaoGlossario',
                    builder: (context, state) {
                      return GestaoGlossarioPage(key: state.pageKey);
                    },
                    routes: [
                      GoRoute(
                        path: 'cadastroGlossario',
                        name: 'CadastroGlossario',
                        builder: (context, state) {
                          return CadastroGlossarioPage(key: state.pageKey);
                        },
                      ),
                      GoRoute(
                        path: 'alterarGlossario',
                        name: 'AlterarGlossario',
                        builder: (context, state) {
                          return GlossarioPage(key: state.pageKey);
                        },
                      ),
                    ]
                  ),
                ],
              ),
            ],
          ),

          // BRANCH -> ESTATISTICA
          StatefulShellBranch(
            navigatorKey: _rootNavigatorEstatistica,
            routes: [
              GoRoute(
                path: '/estatistica',
                name: 'Estatistica',
                builder: (context, state) {
                  return EstatisticasPage(key: state.pageKey);
                },
              )
            ],
          ),

          // BRANCH -> CONFIGURAÇÕES
          StatefulShellBranch(
            navigatorKey: _rootNavigatorConfiguracoes,
            routes: [
              GoRoute(
                path: '/configuracoes',
                name: 'Configuracoes',
                builder: (context, state) {
                  return ConfiguracoesPage(key: state.pageKey);
                },
                routes: [
                  GoRoute(
                    path: 'editarPerfil',
                    name: 'EditarPerfil',
                    builder: (context, state) {
                      return EditarPerfilPage(key: state.pageKey);
                    },
                  ),
                  GoRoute(
                    path: 'redefinirSenha',
                    name: 'RedefinirSenha',
                    builder: (context, state) {
                      return RedefinirSenhaPage(key: state.pageKey);
                    },
                  ),
                ]
              )
            ],
          ),
        ],
      ),

      GoRoute(
        path: '/loginRegister',
        name: 'LoginRegister',
        builder: (context, state) {
          return LoginRegisterPage(key: state.pageKey);
        },
      )
    ],
  );
});