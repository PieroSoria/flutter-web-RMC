import 'package:flutter/material.dart';

import '../../../controller/Function/obtenersection.dart';

class PuntodeVenta extends StatefulWidget {
  final String pageview;
  const PuntodeVenta({super.key, required this.pageview});

  @override
  State<PuntodeVenta> createState() => _PuntodeVentaState();
}

class _PuntodeVentaState extends State<PuntodeVenta> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: ObtenerSectionPage(
              page: widget.pageview,
            ),
          ),
        ],
      ),
    );
  }
}
