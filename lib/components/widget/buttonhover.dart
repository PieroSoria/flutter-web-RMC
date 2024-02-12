import 'package:flutter/material.dart';

class ButtonHover extends StatefulWidget {
  final Function() funcion;
  final String titulo;
  final Color ini;
  final Color fin;
  final double fontsize;
  const ButtonHover(
      {super.key,
      required this.funcion,
      required this.titulo,
      required this.ini,
      required this.fin,
      required this.fontsize});

  @override
  State<ButtonHover> createState() => _ButtonHoverState();
}

class _ButtonHoverState extends State<ButtonHover> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (f) {
        setState(() {
          hover = true;
        });
      },
      onExit: (f) {
        setState(() {
          hover = false;
        });
      },
      child: GestureDetector(
        onTap: widget.funcion,
        child: SizedBox(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: hover ? widget.ini : widget.fin,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: hover ? 20 : 20, vertical: hover ? 10 : 10),
            child: Center(
              child: Text(
                widget.titulo,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: hover ? widget.fin : widget.ini,
                  fontFamily: "Aharoni",
                  fontWeight: FontWeight.bold,
                  fontSize: widget.fontsize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
