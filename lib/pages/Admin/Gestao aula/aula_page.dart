import 'package:cas_natal_app_admin/API/entidades/lesson/lesson_model.dart';
import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_content_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_widget.dart';
import 'package:cas_natal_app_admin/widgets/listas/lista_curso_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AulaPage extends ConsumerStatefulWidget {
  final LessonModel aula;
  const AulaPage({super.key, required this.aula});

  @override
  ConsumerState<AulaPage> createState() => _AulaPageState();
}

class _AulaPageState extends ConsumerState<AulaPage> {
  late final TextEditingController nameCtrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.aula.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 20),
          child: Column(
            children: [
              ContainerWidget(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///
                      Text('Nome:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 50, readOnly: false),
                      ///
                      Text('Curso:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      ListaCursoWidget(txt: 'HCS - História e Cultura Surda'), 
                      SizedBox(height: 20),
                      ///
                      Text('Sinais do glossário:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 50, readOnly: false),
                      ///
                      Text('URL Vídeo:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 50, readOnly: false),
                      ///
                      Text('Conteúdo escrito:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputContentWidget(maxLength: 500),                        
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotaoLaranjaWidget(txt: 'Salvar', onPressed: (){}, tam: 150),
                  SizedBox(width: 20),
                  BotaoLaranjaWidget(txt: 'Cancelar', onPressed: (){}, tam: 150),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}