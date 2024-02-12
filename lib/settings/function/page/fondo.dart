import 'package:flutter/material.dart';

class Fondo extends StatefulWidget {
  const Fondo({super.key});

  @override
  State<Fondo> createState() => _FondoState();
}

class _FondoState extends State<Fondo> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/image/fondo.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
