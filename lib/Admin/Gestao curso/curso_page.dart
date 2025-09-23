import 'package:cas_natal_app_admin/widgets/botoes/bt_icon_widget.dart';
import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/fotos/foto_curso_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_descricao_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/container_widget.dart';
import 'package:flutter/material.dart';

class CursoPage extends StatefulWidget {
  const CursoPage({super.key});

  @override
  State<CursoPage> createState() => _CursoPageState();
}

class _CursoPageState extends State<CursoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('História e Cultura Surda')),
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
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          FotoCursoWidget(height:100),
                          BotaoIconWidget(icon: Icon(Icons.edit)),
                        ],
                      ),
                      SizedBox(height:20),
                      /// NOME
                      Text('Nome:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 50, hintText: 'História e Cultura Surda'),
                      /// DESCRIÇÃO
                      Text('Descrição:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputDescricaoWidget(hintText: 'Este curso apresenta aspectos históricos, sociais e identitários da comunidade surda, com foco na valorização da Libras como primeira língua e no reconhecimento da surdez como diferença, e não deficiência.', maxLength: 150),                        
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