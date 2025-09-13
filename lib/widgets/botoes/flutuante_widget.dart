import 'package:cas_natal_app_admin/cores.dart';
import 'package:flutter/material.dart';

class BotaoFlutuanteWidget extends StatefulWidget {
  final VoidCallback onPressed;
  const BotaoFlutuanteWidget({super.key, required this.onPressed});

  @override
  State<BotaoFlutuanteWidget> createState() => _FlutuanteState();
}

class _FlutuanteState extends State<BotaoFlutuanteWidget> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final cor = Cores();

    return FloatingActionButton.extended(
      foregroundColor: Colors.white,
      backgroundColor: cor.laranja,
      onPressed: () {},

      label: const Text('Novo', style: TextStyle(fontWeight: FontWeight.bold),),
      icon: Icon(Icons.add),
    );
  }
}
