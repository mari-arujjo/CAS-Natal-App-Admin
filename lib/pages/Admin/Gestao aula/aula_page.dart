import 'package:cas_natal_app_admin/API/entidades/lesson/lesson_model.dart';
import 'package:cas_natal_app_admin/popup.dart';
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
  late final TextEditingController codeCtrl;
  late final TextEditingController nameCtrl;
  late final TextEditingController urlCtrl;
  late final TextEditingController contentCtrl;
  String? _selectedCourseId;
  final popUp = PopUp();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    codeCtrl = TextEditingController(text: widget.aula.lessonCode);
    nameCtrl = TextEditingController(text: widget.aula.name);
    urlCtrl = TextEditingController(text: widget.aula.url);
    contentCtrl = TextEditingController(text: widget.aula.content);
    _selectedCourseId = widget.aula.courseId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.aula.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
          child: Column(
            children: [
              ContainerWidget(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///
                      Text('Código:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 50, readOnly: true, controller: codeCtrl),
                      ///
                      Text('Nome:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 50, readOnly: false, controller: nameCtrl),
                      ///
                      Text('Curso:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      ListaCursoWidget(
                        initialCourseId: _selectedCourseId,
                        onChanged: (newId) {
                          setState(() {
                            _selectedCourseId = newId;
                          });
                        },
                      ), 
                      SizedBox(height: 25),
                      ///
                      Text('Sinais do glossário:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 50, readOnly: false),
                      ///
                      Text('URL Vídeo:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 50, readOnly: false, controller: urlCtrl),
                      ///
                      Text('Conteúdo escrito:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputContentWidget(maxLength: 1000, controller: contentCtrl,),                        
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
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