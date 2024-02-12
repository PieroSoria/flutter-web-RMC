import 'package:flutter/material.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';

class SolucionesScreen extends StatefulWidget {
  final String pageview;
  const SolucionesScreen({super.key, required this.pageview});

  @override
  State<SolucionesScreen> createState() => _SolucionesScreenState();
}

class _SolucionesScreenState extends State<SolucionesScreen> {
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
