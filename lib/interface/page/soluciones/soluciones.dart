import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/widget/buttonhover.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';
import 'package:rmc_bussiness/controller/widget/selectwidget.dart';
import 'package:rmc_bussiness/interface/model/tile_assets.dart';

class SolucionesScreen extends StatefulWidget {
  final String pageview;
  const SolucionesScreen({super.key, required this.pageview});

  @override
  State<SolucionesScreen> createState() => _SolucionesScreenState();
}

class _SolucionesScreenState extends State<SolucionesScreen> {
  final controllerwidget = Get.put(WidgetController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 0, 127, 197)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var tile in sideMenustile)
                  ...(tile.title == widget.pageview
                      ? tile.dropdownItems != null
                          ? tile.dropdownItems!.map(
                              (item) => ButtonHover(
                                funcion: () {
                                  switch (item) {
                                    case "Retail":
                                      controllerwidget.indexwidget(2);
                                      break;
                                    case "Restaurante":
                                      controllerwidget.indexwidget(3);
                                      break;
                                    case "Autoservicio":
                                      controllerwidget.indexwidget(4);
                                      break;
                                    case "Almacen e inventarios":
                                      controllerwidget.indexwidget(5);
                                      break;
                                    case "De escritorio":
                                      controllerwidget.indexwidget(7);
                                      break;
                                    case "Movil":
                                      controllerwidget.indexwidget(8);
                                      break;
                                    case "Impresoras Termicas de ticket":
                                      controllerwidget.indexwidget(11);
                                      break;
                                    case "Impresora codigo de barra":
                                      controllerwidget.indexwidget(12);
                                      break;
                                    case "Impresora Termica portatiles":
                                      controllerwidget.indexwidget(13);
                                      break;
                                  }
                                },
                                titulo: item,
                                ini: Colors.white,
                                fin: const Color.fromARGB(255, 0, 127, 192),
                                fontsize: 18,
                              ),
                            )
                          : []
                      : []),
              ],
            ),
          ),
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
