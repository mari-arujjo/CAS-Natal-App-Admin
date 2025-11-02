import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_quadrado_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CAS Natal-RN (ADMIN)'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: [
              ButtonQuadrado(
                txt: 'Gestão de usuários',
                onPressed: () {
                  context.goNamed('GestaoUsers');
                },
                icon: Icons.people,
              ),
              ButtonQuadrado(
                txt: 'Gestão de cursos',
                onPressed: () {
                  context.goNamed('GestaoCurso');
                },
                icon: Icons.school,
              ),
              ButtonQuadrado(
                txt: 'Cadastrar aula',
                onPressed: () {
                  context.goNamed('GestaoAula');
                },
                icon: Icons.play_circle_fill,
              ),
              ButtonQuadrado(
                txt: 'Cadastrar sinal no glossário',
                onPressed: () {
                  context.goNamed('GestaoGlossario');
                },
                icon: Icons.sign_language,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
