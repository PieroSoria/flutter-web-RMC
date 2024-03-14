import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';
import 'package:rmc_bussiness/controller/widget/selectwidget.dart';

class SolucionesRetails extends StatefulWidget {
  final String pageview;
  const SolucionesRetails({super.key, required this.pageview});

  @override
  State<SolucionesRetails> createState() => _SolucionesRetailsState();
}

class _SolucionesRetailsState extends State<SolucionesRetails> {
  final controllerwidget = Get.put(WidgetController());
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
