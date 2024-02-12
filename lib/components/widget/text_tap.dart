import 'package:flutter/material.dart';

class TextOnTap extends StatelessWidget {
  final String titulo;
  final Function() press;
  const TextOnTap({super.key, required this.titulo, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Text(
        titulo,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
