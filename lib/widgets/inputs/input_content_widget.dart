import 'package:cas_natal_app_admin/cores.dart';
import 'package:flutter/material.dart';

class InputContentWidget extends StatefulWidget {
  final String? hintText;
  final int? maxLength;
  const InputContentWidget({super.key, this.hintText, required this.maxLength});

  @override
  State<InputContentWidget> createState() => _InputContentWidgetState();
}

class _InputContentWidgetState extends State<InputContentWidget> {
  final cores = Cores();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cores.azulEscuro,
      maxLength: widget.maxLength,
      minLines: 10,
      maxLines: 500,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: cores.azulEscuro),
        filled: true,
        fillColor: Colors.white,
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: cores.azulEscuro),
        ),
      ),
    );
  }
}
