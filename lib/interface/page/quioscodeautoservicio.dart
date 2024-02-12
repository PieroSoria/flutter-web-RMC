import 'package:flutter/material.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';

class Quiosco extends StatefulWidget {
  final String pageview;
  const Quiosco({super.key, required this.pageview});

  @override
  State<Quiosco> createState() => _QuioscoState();
}

class _QuioscoState extends State<Quiosco> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: ObtenerSectionPage(page: widget.pageview),
          )
        ],
      ),
    );
  }
}
