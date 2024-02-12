import 'package:flutter/material.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';

class DeEscritorio extends StatefulWidget {
  final String pageview;
  const DeEscritorio({super.key, required this.pageview});

  @override
  State<DeEscritorio> createState() => _DeEscritorioState();
}

class _DeEscritorioState extends State<DeEscritorio> {
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
