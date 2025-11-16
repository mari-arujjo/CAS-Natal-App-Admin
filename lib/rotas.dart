import 'package:cas_natal_app_admin/API/entidades/course/course_model.dart';
import 'package:cas_natal_app_admin/API/entidades/lesson/lesson_model.dart';
import 'package:cas_natal_app_admin/API/providers/appuser_provider.dart'; // Importar para ler o storage
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
import 'package:cas_natal_app_admin/widgets/vizualizacao/carregando_widget.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorGestao = GlobalKey<NavigatorState>(debugLabel: 'shellGestao');
final _rootNavigatorEstatistica = GlobalKey<NavigatorState>(debugLabel: 'shellEstatistica');
final _rootNavigatorConfiguracoes = GlobalKey<NavigatorState>(debugLabel: 'shellConfiguracoes');

final goRouterProvider = Provider<GoRouter>((ref) {

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/admin', // Pode manter /admin, o redirect cuida do resto
    navigatorKey: _rootNavigatorKey,

    // Lógica de redirecionamento automático
    redirect: (BuildContext context, GoRouterState state) async {
      // 1. Lê o provider do storage
      final storage = ref.read(secureStorageProvider);
      // 2. Tenta ler o token (operação assíncrona)
      final token = await storage.read(key: 'token');
      // 3. Define se o usuário está logado
      final isLoggedIn = token != null && token.isNotEmpty;
      
      // 4. Define se a rota que o usuário está tentando acessar é a de login
      final isGoingToLogin = state.matchedLocation == '/loginRegister';

      // 5. Lógica de Redirecionamento
      // Se NÃO está logado E NÃO está indo para o login, force-o a ir para o login
      if (!isLoggedIn && !isGoingToLogin) {
        return '/loginRegister';
      }
      
      // Se ESTÁ logado E está tentando ir para o login, mande-o para a home (/admin)
      if (isLoggedIn && isGoingToLogin) {
        return '/admin';
      }

      // Em todos os outros casos, não faça nada (deixe o usuário ir para onde ele quer)
      return null;
    },

    routes: <RouteBase>[
      GoRoute(
        path: '/splash',
        name: 'Splash',
        builder: (context, state) => const CarregandoWidget(),
      ),

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

      // Rota de Login (fora da navegação principal)
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