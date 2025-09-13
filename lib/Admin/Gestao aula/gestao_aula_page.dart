import 'package:flutter/material.dart';

class GestaoAulaPage extends StatefulWidget {
  const GestaoAulaPage({super.key});

  @override
  State<GestaoAulaPage> createState() => _GestaoAulaPageState();
}

class _GestaoAulaPageState extends State<GestaoAulaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestão de aulas')),
    );
  }
}