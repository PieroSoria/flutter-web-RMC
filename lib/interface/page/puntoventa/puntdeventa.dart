import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Function/obtenersection.dart';
import '../../../controller/data/controller_products.dart';
import '../../../controller/widget/selectwidget.dart';

class PuntodeVenta extends StatefulWidget {
  final String pageview;
  const PuntodeVenta({super.key, required this.pageview});

  @override
  State<PuntodeVenta> createState() => _PuntodeVentaState();
}

class _PuntodeVentaState extends State<PuntodeVenta> {
  final controllerwidget = Get.put(WidgetController());
  final controllerproduct = Get.put(ControllerProducts());
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
