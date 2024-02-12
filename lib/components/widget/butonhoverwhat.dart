import 'package:flutter/material.dart';

class BHoverIcon extends StatefulWidget {
  final VoidCallback funcion;
  final String titulo;
  final Color ini;
  final Color fin;
  const BHoverIcon(
      {super.key,
      required this.funcion,
      required this.titulo,
      required this.ini,
      required this.fin});

  @override
  State<BHoverIcon> createState() => _BHoverIconState();
}

class _BHoverIconState extends State<BHoverIcon> {
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
      child: ElevatedButton(
        onPressed: widget.funcion,
        style: ElevatedButton.styleFrom(
          backgroundColor: hover ? widget.ini : widget.fin,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.titulo,
                style: TextStyle(
                  fontFamily: "CenturyGothic",
                  fontSize: 16,
                  color: hover ? widget.fin : widget.ini,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  child: hover
                      ? Image.asset(
                          "icons2/whatsapp1.png",
                          width: 20,
                          height: 20,
                        )
                      : Image.asset(
                          "icons2/whatsapp.png",
                          width: 20,
                          height: 20,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
