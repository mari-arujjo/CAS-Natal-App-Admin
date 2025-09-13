import 'package:cas_natal_app_admin/widgets/botoes/bt_quadrado-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CAS Natal-RN (ADMIN)')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonQuadrado(
                    txt: 'Gestão de usuários', 
                    onPressed: () {
                      context.goNamed('GestaoUsers');
                    },
                    width: 150,
                    height: 150,
                    icon: Icons.people,
                  ),
                  SizedBox(width: 15),
                   ButtonQuadrado(
                    txt: 'Gestão de usuários', 
                    onPressed: () {
                      context.goNamed('GestaoCurso');
                    },
                    width: 150,
                    height: 150,
                    icon:Icons.school,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonQuadrado(
                    txt: 'Cadastrar aula', 
                    onPressed: () {
                      context.goNamed('GestaoAula');
                    },
                    width: 150,
                    height: 150,
                    icon: Icons.play_circle_fill,
                  ),
                  SizedBox(width: 15),
                   ButtonQuadrado(
                    txt: 'Cadastrar sinal no glossário', 
                    onPressed: () {
                      context.goNamed('GestaoGlossario');
                    },
                    width: 150,
                    height: 150,
                    icon: CupertinoIcons.book_solid,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}