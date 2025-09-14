import 'package:cas_natal_app_admin/cores.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatefulWidget {
  final double tam;
  const AvatarWidget({super.key, required this.tam});

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  final cores = Cores();
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.tam,
      backgroundColor: cores.azulEscuro,
      child: Icon(Icons.person, size: 40, color: Colors.white),
    );
  }
}
