import 'package:cas_natal_app_admin/API/entidades/appuser/appuser_model.dart';
import 'package:cas_natal_app_admin/cores.dart';
import 'package:cas_natal_app_admin/popup.dart';
import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_icon_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/ipt_senha_outline_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cas_natal_app_admin/API/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

class LoginRegisterPage extends ConsumerStatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  ConsumerState<LoginRegisterPage> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginRegisterPage> {
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

    ref.listen<AsyncValue<AppUserModel?>>(authControllerProvider, (previous, next) {
      if (next.hasError) {
        popUp.PopUpAlert(context, next.error.toString());
      }
      
      if (next.hasValue && next.value != null) {
        final user = next.value; 
        print('--- LOGIN REALIZADO COM SUCESSO ---');
        print('Usuário: ${user?.userName}');
        print('Token: ${user?.token}');
        print('-------------------------------------');
        context.go('/admin');
      }
    });

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
              onPressed: () async { 
                  final username = usernameLoginCtrl.text;
                  final password = passwordLoginCtrl.text;
                  if(username.isEmpty || password.isEmpty) {
                    popUp.PopUpAlert(context, "Preencha usuário e senha.");
                    return;
                  }
                  ref.read(authControllerProvider.notifier).login(username, password);
              },
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
              onPressed: () async {
                  final name = nameCadastroCtrl.text;
                  final username = usernameCadastroCtrl.text;
                  final email = emailCadastroCtrl.text;
                  final pass1 = passwordCadastroCtrl.text;
                  final pass2 = password2CadastroCtrl.text;

                  if (pass1 != pass2) {
                    popUp.PopUpAlert(context, "As senhas não conferem.");
                    return;
                  }
                  
                  if(name.isEmpty || username.isEmpty || email.isEmpty || pass1.isEmpty) {
                    popUp.PopUpAlert(context, "Preencha todos os campos.");
                    return;
                  }

                  ref.read(authControllerProvider.notifier).register(
                    fullName: name,
                    userName: username,
                    email: email,
                    password: pass1,
                  );
                },
              tam: 1000,
            ),
          ],
        ),
      ),
    );
  }
}