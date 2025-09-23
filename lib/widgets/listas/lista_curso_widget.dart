import 'package:cas_natal_app_admin/cores.dart';
import 'package:flutter/material.dart';

class ListaCursoWidget extends StatefulWidget {
  final ValueChanged <String?>? onChanged;
  final dynamic txt;
  const ListaCursoWidget({
    super.key, 
    this.onChanged,
    required this.txt
  });

  @override
  State<ListaCursoWidget> createState() => _ListaCursoWidgetState();
}

class _ListaCursoWidgetState extends State<ListaCursoWidget> {
  String? roleSelecionada;
  final List<String> listCurso = [
    "HCS - Historia e Cultura Surda",
  ];

  @override
  Widget build(BuildContext context) {
    final cor = Cores();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF494949),
            offset: Offset(0, 1)
          )
        ]
      ),

      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: roleSelecionada,
            dropdownColor: Colors.white,
            isExpanded: true,
            hint: Text(widget.txt, style: TextStyle(color: cor.azulEscuro)),

            items: listCurso.map((String curso){
              return DropdownMenuItem(
                value: curso,
                child: Text(curso, style: TextStyle(color: cor.azulEscuro)),
                );
              }).toList(),

            onChanged:(value) {
              setState(() {
                roleSelecionada = value;
              });
              if(widget.onChanged != null){
                widget.onChanged!(value);
              }
            },

          ),
        ),
      )
    );
  } 
}