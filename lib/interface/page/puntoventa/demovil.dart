import 'package:flutter/material.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';

class DeMovil extends StatefulWidget {
  final String pageview;
  const DeMovil({super.key, required this.pageview});

  @override
  State<DeMovil> createState() => _DeMovilState();
}

class _DeMovilState extends State<DeMovil> {
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
