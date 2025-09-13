import 'package:flutter/material.dart';

class GestaoGlossarioPage extends StatefulWidget {
  const GestaoGlossarioPage({super.key});

  @override
  State<GestaoGlossarioPage> createState() => _GestaoGlossarioPageState();
}

class _GestaoGlossarioPageState extends State<GestaoGlossarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestão do glossário')),
    );
  }
}