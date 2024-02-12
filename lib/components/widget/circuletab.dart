import 'package:flutter/material.dart';

class CirculoTap extends StatefulWidget {
  final Function() function;
  final IconData icon;
  final Color ini;
  final Color fin;
  final double sizeicon;
  final double backgroundsize;
  const CirculoTap({
    super.key,
    required this.function,
    required this.icon,
    required this.ini,
    required this.fin,
    required this.sizeicon,
    required this.backgroundsize,
  });

  @override
  State<CirculoTap> createState() => _CirculoTapState();
}

class _CirculoTapState extends State<CirculoTap> {
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
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: widget.function,
        // child: CircleAvatar(
        //   backgroundColor: widget.background,
        //   radius: 30,
        //   child: widget.icon,
        // ),
        child: AnimatedContainer(
          padding: EdgeInsets.all(widget.backgroundsize),
          duration: const Duration(milliseconds: 200),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: hover ? widget.fin : widget.ini, shape: BoxShape.circle),
          child: Icon(
            widget.icon,
            color: hover ? widget.ini : widget.fin,
            size: widget.sizeicon,
          ),
        ),
      ),
    );
  }
}
