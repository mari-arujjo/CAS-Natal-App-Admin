import 'package:cas_natal_app_admin/API/entidades/course/course_model.dart';
import 'package:cas_natal_app_admin/popup.dart';
import 'package:cas_natal_app_admin/providers/course_provider.dart';
import 'package:cas_natal_app_admin/widgets/botoes/bt_icon_widget.dart';
import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/fotos/foto_curso_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_descricao_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CadastroCursoPage extends ConsumerWidget {
  const CadastroCursoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final TextEditingController nameCtrl = TextEditingController();
    final TextEditingController symbolCtrl = TextEditingController();
    final TextEditingController descriptionCtrl = TextEditingController();
    final PopUp popUp = PopUp();

    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de cursos')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ContainerWidget(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          FotoCursoWidget(height:100),
                          BotaoIconWidget(icon: Icon(Icons.edit)),
                        ],
                      ),
                      SizedBox(height:20),
                      ///
                      Text('Nome:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 50, controller: nameCtrl, readOnly: false),
                      ///
                      Text('Abreviação:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 4, controller: symbolCtrl, readOnly: false),
                      ///
                      Text('Descrição:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputDescricaoWidget(maxLength: 150, controller: descriptionCtrl),                        
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotaoLaranjaWidget(txt: 'Cancelar', tam: 150, onPressed: (){}),
                  SizedBox(width: 20),
                  BotaoLaranjaWidget(
                    txt: 'Salvar', 
                    tam: 150, 
                    onPressed: () async {
                      if (nameCtrl.text.isEmpty || symbolCtrl.text.isEmpty || descriptionCtrl.text.isEmpty){
                        popUp.PopUpAlert(context, 'Preencha os campos obrigatórios.');
                        return;
                      }
                      final course = CourseModel(name: nameCtrl.text, symbol: symbolCtrl.text, description: descriptionCtrl.text);
                      try{
                        await ref.read(courseProvider.notifier).addCourse(course);
                        if (context.mounted) {
                          popUp.PopUpSalvar(context);
                        }
                      } catch(e){
                        if (context.mounted) {
                          popUp.PopUpAlert(context, 'Erro: $e');
                        }
                      }
                    }
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}