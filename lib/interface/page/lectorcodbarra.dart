import 'package:flutter/material.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';


class LectorCodBarra extends StatefulWidget {
  final String pageview;
  const LectorCodBarra({super.key, required this.pageview});

  @override
  State<LectorCodBarra> createState() => _LectorCodBarraState();
}

class _LectorCodBarraState extends State<LectorCodBarra> {
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
