import 'package:cas_natal_app_admin/cores.dart';
import 'package:cas_natal_app_admin/popup.dart';
import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_icon_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/ipt_senha_outline_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginPage> {
  final TextEditingController usernameLoginCtrl = TextEditingController();
  final TextEditingController passwordLoginCtrl = TextEditingController();

  final TextEditingController nameCadastroCtrl = TextEditingController();
  final TextEditingController usernameCadastroCtrl = TextEditingController();
  final TextEditingController emailCadastroCtrl = TextEditingController();
  final TextEditingController passwordCadastroCtrl = TextEditingController();
  final TextEditingController password2CadastroCtrl = TextEditingController();
  
  final PopUp popUp = PopUp();

  @override
  Widget build(BuildContext context) {
    final cor = Cores();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 5,
          bottom: TabBar(
            indicatorColor: cor.azulEscuro,
            labelColor: cor.azulEscuro,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Cadastro'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildLoginForm(cor),
            _buildRegisterForm(cor),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('CAS Natal/RN + IFRN', style: TextStyle(fontSize: 12, color: cor.gray)),
                Text('Desenvolvido por Mariana Araújo', style: TextStyle(fontSize: 12, color: cor.gray)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(Cores cor) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 70, bottom: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/avatar/menino2.png', height: 150),
            SizedBox(height: 20),
            Text('Bem vindo de volta!', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
              ContainerWidget(
              child: Form(
                child: Column(
                  children: [
                    InputOutline(
                      txt: "Usuário",
                      ico: Icon(Icons.person),
                      controller: usernameLoginCtrl,
                    ),
                    SizedBox(height: 15),
                    InputOutlineSenha(
                      txt: "Senha",
                      controller: passwordLoginCtrl,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            BotaoLaranjaWidget(
              txt: 'Entrar',
                onPressed: () async {},
              tam: 1000,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterForm(Cores cor) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/avatar/menina2.png', height: 130),
            SizedBox(height: 20),
            Text('Crie agora a sua conta!', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
              ContainerWidget(
              child: Form(
                child: Column(
                  children: [
                    InputOutline(
                      txt: "Nome",
                      ico: Icon(Icons.person),
                      controller: nameCadastroCtrl,
                    ),
                    SizedBox(height: 15),
                    InputOutline(
                      txt: "Username",
                      ico: Icon(Icons.alternate_email),
                      controller: usernameCadastroCtrl,
                    ),
                    SizedBox(height: 15),
                    InputOutline(
                      txt: "Email",
                      ico: Icon(Icons.email),
                      controller: emailCadastroCtrl,
                    ),
                    SizedBox(height: 15),
                    InputOutlineSenha(
                      txt: "Senha",
                      controller: passwordCadastroCtrl,
                    ),
                    SizedBox(height: 15),InputOutlineSenha(
                      txt: "Confirmar senha",
                      controller: password2CadastroCtrl,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            BotaoLaranjaWidget(
              txt: 'Cadastrar',
                onPressed: () async {},
              tam: 1000,
            ),
          ],
        ),
      ),
    );
  }
}