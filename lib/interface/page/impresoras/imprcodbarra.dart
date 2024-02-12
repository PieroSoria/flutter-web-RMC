import 'package:flutter/material.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';

class ImprCodBarra extends StatefulWidget {
  final String pageview;
  const ImprCodBarra({super.key, required this.pageview});

  @override
  State<ImprCodBarra> createState() => _ImprCodBarraState();
}

class _ImprCodBarraState extends State<ImprCodBarra> {
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
