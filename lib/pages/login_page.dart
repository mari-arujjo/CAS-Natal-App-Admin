import 'package:cas_natal_app_admin/cores.dart';
import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/ipt_outline_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/ipt_senha_outline_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  bool isChecked = false;
  bool obscurePassword = true;
  late TextEditingController usuarioController;
  late TextEditingController senhaController;

  @override
  void initState() {
    super.initState();
    usuarioController = TextEditingController();
    senhaController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    usuarioController = TextEditingController();
    senhaController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final cor = Cores();

    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Bem vindo de volta!', style: TextStyle(fontSize: 18)),

              SizedBox(height: 40),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  child: Column(
                   children: [
                      InputOutline(
                        txt: "Usuário",
                        ico: Icon(Icons.people,),
                        controller: usuarioController,
                      ),

                      SizedBox(height: 20),

                      InputOutlineSenha(
                        txt: "Senha",
                        controller: senhaController,
                      ),

                      SizedBox(height: 20),
                      Text('Ainda não possui conta? Crie uma agora!', style: TextStyle(fontSize: 12)),

                      SizedBox(height: 20),
                      BotaoLaranjaWidget(
                        txt: 'Entrar',
                        onPressed: () async {},
                        tam: 150,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
