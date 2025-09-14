import 'package:cas_natal_app_admin/cores.dart';
import 'package:cas_natal_app_admin/widgets/botoes/bt_icon_widget.dart';
import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_widget.dart';
import 'package:cas_natal_app_admin/widgets/listas/lista_role_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/avatar_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/container_widget.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final cores = Cores();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('@mari.arujjo')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    AvatarWidget(tam: 60),
                    BotaoIconWidget(icon: Icon(Icons.edit)),
                  ],
                ),
                SizedBox(height: 20),
                ContainerWidget(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nome:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadraoWidget(
                          maxLength: 50,
                          hintText: 'Mariana Araújo Silva',
                        ),

                        Text('Usuário:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadraoWidget(
                          maxLength: 20,
                          hintText: 'mari.arujjo',
                        ),

                        Text('Email:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadraoWidget(
                          maxLength: 150,
                          hintText: 'mariana.araujo@email.com',
                        ),

                        Text('Role:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        ListaRoleWidget(txt: '1 - Administrador'), 
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BotaoLaranjaWidget(
                      txt: 'Salvar',
                      onPressed: () {},
                      tam: 120,
                    ),
                    SizedBox(width: 20),
                    BotaoLaranjaWidget(
                      txt: 'Cancelar',
                      onPressed: () {},
                      tam: 120,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}