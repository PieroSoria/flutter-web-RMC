import 'package:flutter/material.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';

class ImprTermicaPortatil extends StatefulWidget {
  final String pageview;
  const ImprTermicaPortatil({super.key, required this.pageview});

  @override
  State<ImprTermicaPortatil> createState() => _ImprTermicaPortatilState();
}

class _ImprTermicaPortatilState extends State<ImprTermicaPortatil> {
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
