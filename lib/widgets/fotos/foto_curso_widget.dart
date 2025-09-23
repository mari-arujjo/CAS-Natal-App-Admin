import 'package:cas_natal_app_admin/cores.dart';
import 'package:flutter/material.dart';

class FotoCursoWidget extends StatefulWidget {
  final double height;
  const FotoCursoWidget({super.key, required this.height});

  @override
  State<FotoCursoWidget> createState() => _FotoCursoWidgetState();
}

class _FotoCursoWidgetState extends State<FotoCursoWidget> {
  final cores = Cores();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,  
      height: widget.height,
      decoration: BoxDecoration(
        color: cores.azulEscuro,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.school,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}
