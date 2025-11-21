import 'package:cas_natal_app_admin/API/course/course_model.dart';
import 'package:cas_natal_app_admin/popup.dart';
import 'package:cas_natal_app_admin/API/course/course_provider.dart';
import 'package:cas_natal_app_admin/widgets/botoes/bt_icon_widget.dart';
import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/fotos/foto_curso_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_descricao_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CursoPage extends ConsumerStatefulWidget {
  final CourseModel curso;
  const CursoPage({super.key, required this.curso});

  @override
  ConsumerState<CursoPage> createState() => _CursoPageState();
}

class _CursoPageState extends ConsumerState<CursoPage> {
  late final TextEditingController nameCtrl;
  late final TextEditingController codeCtrl;
  late final TextEditingController symbolCtrl;
  late final TextEditingController descriptionCtrl;
  final PopUp popUp = PopUp();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    nameCtrl = TextEditingController(text: widget.curso.name);
    codeCtrl = TextEditingController(text: widget.curso.courseCode);
    symbolCtrl = TextEditingController(text: widget.curso.symbol);
    descriptionCtrl = TextEditingController(text: widget.curso.description);
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.curso.name)),
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
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          FotoCursoWidget(height:120),
                          BotaoIconWidget(icon: Icon(Icons.edit)),
                        ],
                      ),
                      SizedBox(height:20),
                      ///
                      Text('Código:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 13, controller: codeCtrl, readOnly: true),
                      ///
                      Text('Nome:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 50, controller: nameCtrl, readOnly: false),
                      ///
                      Text('Abreviação:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 4, controller: symbolCtrl,readOnly: false),
                      ///
                      Text('Descrição:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputDescricaoWidget(controller: descriptionCtrl, maxLength: 150),                        
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BotaoLaranjaWidget(
                        txt: 'Excluir', 
                        tam: 150, 
                        onPressed: () async {
                          try {
                              await ref.read(courseProvider.notifier).deleteCourse(widget.curso.id!);
                              if (context.mounted) {
                                popUp.PopUpExcluido(context);
                              }
                            } catch (e) {
                              if (context.mounted) {
                                popUp.PopUpAlert(context, 'Erro ao excluir: $e');
                              }
                            }
                        }
                      ),
                      SizedBox(width: 20),
                      BotaoLaranjaWidget(
                        txt: 'Salvar', 
                        tam: 150, 
                        onPressed: () async {
                          if (nameCtrl.text == widget.curso.name && symbolCtrl.text == widget.curso.symbol && descriptionCtrl.text == widget.curso.description){
                            popUp.PopUpAlert(context, 'Nenhum dado foi alterado.');
                            return;
                          }
                          if (nameCtrl.text.isEmpty || symbolCtrl.text.isEmpty || descriptionCtrl.text.isEmpty){
                            popUp.PopUpAlert(context, 'Preencha os campos obrigatórios.');
                            return;
                          }
                          final courseAtualizado = CourseModel(id: widget.curso.id, name: nameCtrl.text, symbol: symbolCtrl.text, description: descriptionCtrl.text);
                          try{
                            await ref.read(courseProvider.notifier).updateCourse(courseAtualizado, widget.curso.id!);
                            if (context.mounted) {
                              popUp.PopUpAlterado(context);
                            }
                          } catch(e){
                            if (context.mounted) {
                              popUp.PopUpAlert(context, 'Erro: $e');
                            }
                          }                        
                        }
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  BotaoLaranjaWidget(txt: 'Cancelar', tam: 150, onPressed: (){}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}