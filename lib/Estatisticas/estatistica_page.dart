import 'package:cas_natal_app_admin/widgets/estatistica/card_estatistica_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EstatisticasPage extends StatefulWidget {
  const EstatisticasPage({super.key});

  @override
  State<EstatisticasPage> createState() => _EstatisticasPageState();
}

class _EstatisticasPageState extends State<EstatisticasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estatísticas')),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardEstatisticaWidget(
              txt: 'Users cadastrados',
              dado: '?',
              ico: Icons.people
            ),
            SizedBox(height: 15),
            CardEstatisticaWidget(
              txt: 'Cursos cadastrados',
              dado: '?',
              ico: Icons.school,
            ),
            SizedBox(height: 15),
            CardEstatisticaWidget(
              txt: 'Aulas cadastradas',
              dado: '?',
              ico: Icons.play_circle_fill,
            ),
            SizedBox(height: 15),
            CardEstatisticaWidget(
              txt: 'Sinais cadastrados no glossário',
              dado: '?',
              ico: CupertinoIcons.book_solid,
            ),
          ],
        ),
      ),
    );
  }
}
