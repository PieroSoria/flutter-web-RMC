import 'package:flutter/material.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';

class AutoServicio extends StatefulWidget {
  final String pageview;
  const AutoServicio({super.key, required this.pageview});

  @override
  State<AutoServicio> createState() => _AutoServicioState();
}

class _AutoServicioState extends State<AutoServicio> {
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
