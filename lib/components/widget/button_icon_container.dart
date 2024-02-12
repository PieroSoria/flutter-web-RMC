import 'package:flutter/material.dart';

class ButtonIconContainer extends StatefulWidget {
  final Function() funcion;
  final String titulo;
  final Color ini;
  final Color fin;
  final double fontsize;
  final Icon? icon;
  const ButtonIconContainer(
      {super.key,
      required this.funcion,
      required this.titulo,
      required this.ini,
      required this.fin,
      required this.fontsize,
      this.icon});

  @override
  State<ButtonIconContainer> createState() => _ButtonIconContainerState();
}

class _ButtonIconContainerState extends State<ButtonIconContainer> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          hover = true;
        });
      },
      onExit: (event) {
        setState(() {
          hover = false;
        });
      },
      child: GestureDetector(
        onTap: widget.funcion,
        child: Container(
          width: 180,
          height: 180,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: hover ? widget.ini : widget.fin,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color.fromARGB(255, 211, 211, 211)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.icon,
              ),
              Text(
                widget.titulo,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: hover ? widget.fin : widget.ini,
                  fontSize: widget.fontsize,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
