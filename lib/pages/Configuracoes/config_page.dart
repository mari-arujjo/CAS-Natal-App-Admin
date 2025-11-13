import 'package:cas_natal_app_admin/cores.dart';
import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/botoes/bt_menu_widget.dart';
import 'package:cas_natal_app_admin/widgets/fotos/avatar_widget.dart';
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

    return Scaffold(
      appBar: AppBar(toolbarHeight: 40),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 15),
                    const AvatarWidget(tam: 30),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'user.fullName',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'user.email',
                          style: TextStyle(
                            color: cores.azulEscuro,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
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
                  onPressed: () {
                    //ref.read(authControllerProvider.notifier).logout();
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