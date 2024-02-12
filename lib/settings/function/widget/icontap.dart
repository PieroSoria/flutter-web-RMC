import 'package:flutter/material.dart';

class IconTap extends StatefulWidget {
  final VoidCallback funcion;
  final String titulo;
  const IconTap({
    super.key,
    required this.funcion,
    required this.titulo,
  });

  @override
  State<IconTap> createState() => _IconTapState();
}

class _IconTapState extends State<IconTap> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ElevatedButton(
        onPressed: widget.funcion,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          widget.titulo,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "CenturyGothic",
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
