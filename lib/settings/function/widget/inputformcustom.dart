import 'package:flutter/material.dart';

class InputFormCustom extends StatefulWidget {
  final double width;
  final double height;
  final String titulo;
  final TextEditingController controllerform;
  const InputFormCustom(
      {super.key,
      required this.controllerform,
      required this.width,
      required this.height,
      required this.titulo});

  @override
  State<InputFormCustom> createState() => _InputFormCustomState();
}

class _InputFormCustomState extends State<InputFormCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            widget.titulo,
            style: const TextStyle(
              fontFamily: "CenturyGothic",
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: widget.width,
            height: widget.height,
            child: TextFormField(
              controller: widget.controllerform,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
