import 'package:flutter/material.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';

class AlmaceneInventario extends StatefulWidget {
  final String pageview;
  const AlmaceneInventario({super.key, required this.pageview});

  @override
  State<AlmaceneInventario> createState() => _AlmaceneInventarioState();
}

class _AlmaceneInventarioState extends State<AlmaceneInventario> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: ObtenerSectionPage(page: widget.pageview),
          ),
        ],
      ),
    );
  }
}
