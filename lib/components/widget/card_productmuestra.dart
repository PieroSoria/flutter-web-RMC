import 'package:flutter/material.dart';
import 'package:rmc_bussiness/components/widget/buttonhover.dart';

class CardProductMuestra extends StatefulWidget {
  final String urlimagen;
  final String nombreproduct;
  final String categoria;
  final String namebutton;
  final VoidCallback funcion;
  const CardProductMuestra(
      {super.key,
      required this.urlimagen,
      required this.nombreproduct,
      required this.namebutton,
      required this.funcion,
      required this.categoria});

  @override
  State<CardProductMuestra> createState() => _CardProductMuestraState();
}

class _CardProductMuestraState extends State<CardProductMuestra> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 127, 127, 127)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            widget.urlimagen,
            width: 170,
            height: 200,
          ),
          Text(
            widget.nombreproduct,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: "CenturyGothic",
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Text(
            widget.categoria,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: "CenturyGothic",
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 150,
            child: ButtonHover(
              funcion: widget.funcion,
              titulo: widget.namebutton,
              ini: const Color.fromARGB(255, 0, 112, 192),
              fin: Colors.white,
              fontsize: 18,
            ),
          )
        ],
      ),
    );
  }
}
