import 'package:flutter/material.dart';

class GestaoCursoPage extends StatefulWidget {
  const GestaoCursoPage({super.key});

  @override
  State<GestaoCursoPage> createState() => _GestaoCursoPageState();
}

class _GestaoCursoPageState extends State<GestaoCursoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestão de cursos')),
    );
  }
}