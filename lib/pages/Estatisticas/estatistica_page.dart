import 'package:cas_natal_app_admin/providers/course_provider.dart';
import 'package:cas_natal_app_admin/widgets/estatistica/card_estatistica_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EstatisticasPage extends ConsumerStatefulWidget {
  const EstatisticasPage({super.key});

  @override
  ConsumerState<EstatisticasPage> createState() => _EstatisticasPageState();
}

class _EstatisticasPageState extends ConsumerState<EstatisticasPage> {
  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(courseProvider);
    final String courseCount = courseState.when(
      data: (courses) => courses.length.toString(),
      loading: () => '...',
      error: (err, stack) => '?',
    );

    return Scaffold(
      appBar: AppBar(title: Text('Estatísticas')),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardEstatisticaWidget(
              txt: 'Usuários cadastrados',
              dado: '?',
              ico: Icons.people
            ),
            SizedBox(height: 15),
            CardEstatisticaWidget(
              txt: 'Cursos cadastrados',
              dado: courseCount,
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