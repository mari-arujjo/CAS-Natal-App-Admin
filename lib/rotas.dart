import 'package:cas_natal_app_admin/API/entidades/course/course_model.dart';
import 'package:cas_natal_app_admin/API/entidades/lesson/lesson_model.dart';
import 'package:cas_natal_app_admin/API/providers/auth_providers.dart'; // <-- IMPORTAR
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
import 'package:flutter_riverpod/flutter_riverpod.dart'; // <-- IMPORTAR
import 'package:go_router/go_router.dart';

// Defina as chaves de navegação globalmente
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorGestao = GlobalKey<NavigatorState>(debugLabel: 'shellGestao');
final _rootNavigatorEstatistica = GlobalKey<NavigatorState>(debugLabel: 'shellEstatistica');
final _rootNavigatorConfiguracoes = GlobalKey<NavigatorState>(debugLabel: 'shellConfiguracoes');

// Crie o Provider para o GoRouter
final goRouterProvider = Provider<GoRouter>((ref) {
  
  // Assista ao estado de autenticação
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/admin', // Sua home inicial
    navigatorKey: _rootNavigatorKey,

    // LÓGICA DE REDIRECT
    redirect: (BuildContext context, GoRouterState state) {
      
      // Se está carregando o estado de auth (lendo o secure storage), não faça nada
      if (authState.isLoading) {
        return null; // Mostra uma tela de splash (se houver) ou branca
      }

      // Verifica se o usuário está logado
      final isLoggedIn = authState.hasValue && authState.value != null;

      // A rota que o usuário está tentando acessar
      final isGoingToLogin = state.matchedLocation == '/login';

      // Se NÃO está logado E NÃO está indo para a tela de login -> redireciona para /login
      if (!isLoggedIn && !isGoingToLogin) {
        return '/login';
      }

      // Se ESTÁ logado E ESTÁ indo para a tela de login -> redireciona para /admin (home)
      if (isLoggedIn && isGoingToLogin) {
        return '/admin';
      }

      // Em todos os outros casos, permite a navegação
      return null;
    },

    routes: <RouteBase>[
      // (COLE SUAS ROTAS ORIGINAIS AQUI)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavigationBarWidget(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          ////////////// BRANCH -> GESTAO
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
                    path: 'gestaoUsers', // Caminho relativo
                    name: 'GestaoUsers',
                    builder: (context, state) {
                      return GestaoUsersPage(key: state.pageKey);
                    },
                    routes: [
                      GoRoute(
                        path: 'cadastroUser', // Caminho relativo
                        name: 'CadastroUser',
                        builder: (context, state) {
                          return CadastrarUserPage(key: state.pageKey);
                        },
                      ),
                      GoRoute(
                        path: 'alterarUser', // Caminho relativo
                        name: 'AlterarUser',
                        builder: (context, state) {
                          return UserPage(key: state.pageKey);
                        },
                      )
                    ]
                  ),
                  GoRoute(
                    path: 'gestaoCurso', // Caminho relativo
                    name: 'GestaoCurso',
                    builder: (context, state) {
                      return GestaoCursoPage(key: state.pageKey);
                    },
                    routes: [
                      GoRoute(
                        path: 'cadastroCurso', // Caminho relativo
                        name: 'CadastroCurso',
                        builder: (context, state) {
                          return CadastroCursoPage(key: state.pageKey);
                        },
                      ),
                      GoRoute(
                        path: 'alterarCurso', // Caminho relativo
                        name: 'AlterarCurso',
                        builder: (context, state) {
                          final curso = state.extra as CourseModel;
                          return CursoPage(key: state.pageKey, curso: curso);
                        },
                      ),
                    ]
                  ),
                  GoRoute(
                    path: 'gestaoAula', // Caminho relativo
                    name: 'GestaoAula',
                    builder: (context, state) {
                      return GestaoAulaPage(key: state.pageKey);
                    },
                    routes: [
                      GoRoute(
                        path: 'cadastroAula', // Caminho relativo
                        name: 'CadastroAula',
                        builder: (context, state) {
                          return CadastroAulaPage(key: state.pageKey);
                        },
                      ),
                      GoRoute(
                        path: 'alterarAula', // Caminho relativo
                        name: 'AlterarAula',
                        builder: (context, state) {
                          final aula = state.extra as LessonModel;
                          return AulaPage(key: state.pageKey, aula: aula);
                        },
                      ),
                    ]
                  ),
                  GoRoute(
                    path: 'gestaoGlossario', // Caminho relativo
                    name: 'GestaoGlossario',
                    builder: (context, state) {
                      return GestaoGlossarioPage(key: state.pageKey);
                    },
                    routes: [
                      GoRoute(
                        path: 'cadastroGlossario', // Caminho relativo
                        name: 'CadastroGlossario',
                        builder: (context, state) {
                          return CadastroGlossarioPage(key: state.pageKey);
                        },
                      ),
                      GoRoute(
                        path: 'alterarGlossario', // Caminho relativo
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

          ////////////// BRANCH -> ESTATISTICA
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

          ////////////// BRANCH -> CONFIGURAÇÕES
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
                    path: 'editarPerfil', // Caminho relativo
                    name: 'EditarPerfil',
                    builder: (context, state) {
                      return EditarPerfilPage(key: state.pageKey);
                    },
                  ),
                  GoRoute(
                    path: 'redefinirSenha', // Caminho relativo
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

      // ROTA DE LOGIN (fora do shell)
      GoRoute(
        path: '/login',
        name: 'Login',
        builder: (context, state) {
          return LoginPage(key: state.pageKey);
        },
      )
    ],
  );
});