import 'package:flutter/material.dart';

class GestaoUsersPage extends StatefulWidget {
  const GestaoUsersPage({super.key});

  @override
  State<GestaoUsersPage> createState() => _GestaoUsersPageState();
}

class _GestaoUsersPageState extends State<GestaoUsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestão de usuários')),
    );
  }
}