import 'package:flutter/material.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';

class ImpresorasScreen extends StatefulWidget {
  final String pageview;
  const ImpresorasScreen({super.key, required this.pageview});

  @override
  State<ImpresorasScreen> createState() => _ImpresorasScreenState();
}

class _ImpresorasScreenState extends State<ImpresorasScreen> {
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
