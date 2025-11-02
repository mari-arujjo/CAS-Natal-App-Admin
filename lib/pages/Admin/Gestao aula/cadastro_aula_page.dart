import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_content_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_widget.dart';
import 'package:cas_natal_app_admin/widgets/listas/lista_curso_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/container_widget.dart';
import 'package:flutter/material.dart';
class CadastroAulaPage extends StatefulWidget {
  const CadastroAulaPage({super.key});

  @override
  State<CadastroAulaPage> createState() => _CadastroAulaPageState();
}

class _CadastroAulaPageState extends State<CadastroAulaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de aulas')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
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
                      ListaCursoWidget(txt: 'Selecione o curso da aula'), 
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