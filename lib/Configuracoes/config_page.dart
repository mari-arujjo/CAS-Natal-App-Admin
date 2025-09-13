
import 'package:cas_natal_app_admin/cores.dart';
import 'package:cas_natal_app_admin/widgets/botoes/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/botoes/bt_menu_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/foto.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  final cores = Cores();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(toolbarHeight: 40),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15),
                    FotoWidget(tam: 30),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mariana Araújo Silva',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'mariana.araujo@email.com',
                          style: TextStyle(
                            color: cores.azulEscuro,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15),

                BotaoLaranjaWidget(
                  txt: 'Editar perfil',
                  onPressed: () {
                    context.goNamed('EditarPerfil');
                  },
                  tam: 360,
                ),

                SizedBox(height: 30),
                BotaoMenuWidget(
                  onPressed: () {
                    context.goNamed('RedefinirSenha');
                  },
                  txt: 'Redefinir senha',
                  tam: 360,
                  iconInicio: Icons.lock,
                ),

                SizedBox(height: 5),
                BotaoMenuWidget(
                  onPressed: () {},
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
}
