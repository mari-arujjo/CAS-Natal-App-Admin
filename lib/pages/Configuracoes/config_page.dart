// ignore_for_file: use_build_context_synchronously

import 'package:cas_natal_app_admin/src/appuser/appuser_provider.dart';
import 'package:cas_natal_app_admin/cores.dart';
import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/botoes/bt_menu_widget.dart';
import 'package:cas_natal_app_admin/widgets/fotos/avatar_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/carregando_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConfiguracoesPage extends ConsumerStatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  ConsumerState<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends ConsumerState<ConfiguracoesPage> {
  final cores = Cores();

  @override
  Widget build(BuildContext context) {
    final asyncUser = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(toolbarHeight: 40),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: Column(
              children: [

                asyncUser.when(
                  data: (user){
                    if (user == null) return const Text('Usuário inválido');
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 15),
                        const AvatarWidget(tam: 40),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.fullName,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                              Text(
                                user.email,
                                style: TextStyle(
                                  color: cores.azulEscuro,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  loading: () => CarregandoWidget(),
                  error:(error, stackTrace) => Text('Erro: $error'),
                ),
                
                const SizedBox(height: 15),
                BotaoLaranjaWidget(
                  txt: 'Editar perfil',
                  onPressed: () {
                    context.goNamed('EditarPerfil');
                  },
                  tam: 360,
                ),
                const SizedBox(height: 30),
                BotaoMenuWidget(
                  onPressed: () {
                    context.goNamed('RedefinirSenha');
                  },
                  txt: 'Redefinir senha',
                  tam: 360,
                  iconInicio: Icons.lock,
                ),
                const SizedBox(height: 5),
                BotaoMenuWidget(
                  onPressed: () async {
                    return await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Sair'),
                          content: const Text(
                            'Tem certeza que deseja sair? Você terá que fazer login novamente.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => context.pop(false),
                              child: Text('Não', style: TextStyle(color: cores.azulEscuro)),
                            ),
                            TextButton(
                              onPressed:() async {
                                await ref.read(secureStorageProvider).deleteAll();
                                if (!mounted) return;
                                context.goNamed('LoginRegister');
                                context.pop(true);
                              },
                              child: Text('Sim', style: TextStyle(color: cores.azulEscuro)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  txt: 'Sair',
                  tam: 360,
                  iconInicio: Icons.logout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*Widget _buildLoggedOutUI() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você não está logado :(',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            BotaoLaranjaWidget(
              txt: 'Entre ou cadastre-se agora!',
              onPressed: () {
                context.pushNamed('LoginRegister');
              },
              tam: 360,
            ),
          ],
        ),
      ),
    );
  }*/
}