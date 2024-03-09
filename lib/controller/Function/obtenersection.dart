import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/controller/Function/tipesection.dart';

import '../../components/layout/footer.dart';
import '../data/controller_products.dart';
import '../widget/selectwidget.dart';

class ObtenerSectionPage extends StatefulWidget {
  final String page;
  const ObtenerSectionPage({super.key, required this.page});

  @override
  State<ObtenerSectionPage> createState() => _ObtenerSectionPageState();
}

class _ObtenerSectionPageState extends State<ObtenerSectionPage> {
  final controllerwidget = Get.put(WidgetController());
  final controllerproduct = Get.put(ControllerProducts());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controllerwidget.obtenersection(widget.page),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              "NO SE ENCONTRO NADA",
              style: TextStyle(
                fontFamily: "CenturyGothic",
                fontSize: 30,
                color: Color.fromARGB(255, 0, 112, 192),
              ),
            ),
          );
        } else {
          final section = snapshot.data!;

          return ListView.builder(
            itemCount: section.length,
            itemBuilder: (context, index) {
              if (index == section.length - 1) {
                return Column(
                  children: [
                    SizedBox(
                      width: 1200,
                      child: TipeSection(index: index),
                    ),
                    const FoorterPage(),
                  ],
                );
              } else {
                return SizedBox(
                  width: 1200,
                  child: TipeSection(index: index),
                );
              }
            },
          );
        }
      },
    );
  }
}
