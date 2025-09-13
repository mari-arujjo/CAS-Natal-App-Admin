import 'package:cas_natal_app_admin/widgets/botoes/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/container_widget.dart';
import 'package:flutter/material.dart';

class RedefinirSenhaPage extends StatefulWidget {
  const RedefinirSenhaPage({super.key});

  @override
  State<RedefinirSenhaPage> createState() => _RedefinirSenhaPageState();
}

class _RedefinirSenhaPageState extends State<RedefinirSenhaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Redefinir senha')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              ContainerWidget(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nova senha:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 20),

                      Text(
                        'Confirmar nova senha:',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      InputPadraoWidget(maxLength: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotaoLaranjaWidget(txt: 'Salvar', onPressed: () {}, tam: 120),
                  SizedBox(width: 20),
                  BotaoLaranjaWidget(
                    txt: 'Cancelar',
                    onPressed: () {},
                    tam: 120,
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
