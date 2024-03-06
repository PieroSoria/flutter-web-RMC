import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hover_menu/hover_menu.dart';
import 'package:rmc_bussiness/controller/widget/selectwidget.dart';

import 'buttonhover.dart';

class SideMenuTile extends StatefulWidget {
  final String? titulo;
  final List<String>? dropmenuitem;
  final VoidCallback press;
  const SideMenuTile(
      {super.key,
      required this.titulo,
      required this.press,
      this.dropmenuitem});

  @override
  State<SideMenuTile> createState() => _SideMenuTileState();
}

class _SideMenuTileState extends State<SideMenuTile> {
  final controllerwidget = Get.put(WidgetController());
  @override
  Widget build(BuildContext context) {
    return widget.dropmenuitem == null
        ? ButtonHover(
            funcion: widget.press,
            titulo: widget.titulo!,
            fin: const Color.fromARGB(255, 0, 112, 192),
            ini: Colors.white,
            fontsize: 16,
          )
        : HoverMenu(
            title: ButtonHover(
              funcion: () {
                switch (widget.titulo) {
                  case "Soluciones":
                    controllerwidget.indexwidget(1);
                    break;
                  case "Punto de Venta":
                    controllerwidget.indexwidget(6);
                    break;
                  case "Impresoras":
                    controllerwidget.indexwidget(10);
                    break;
                }
              },
              titulo: widget.titulo!,
              fin: const Color.fromARGB(255, 0, 112, 192),
              ini: Colors.white,
              fontsize: 18,
            ),
            items: widget.dropmenuitem!
                .map(
                  (item) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: widget.dropmenuitem!.last == item
                          ? const BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            )
                          : widget.dropmenuitem!.first == item
                              ? const BorderRadius.vertical(
                                  top: Radius.circular(20),
                                )
                              : const BorderRadius.all(
                                  Radius.circular(0),
                                ),
                    ),
                    child: ButtonHover(
                      funcion: () {
                        String value = item;
                        switch (value) {
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
                      ini: const Color.fromARGB(255, 14, 125, 216),
                      fin: Colors.white,
                      fontsize: 18,
                    ),
                  ),
                )
                .toList(),
          );
  }
}
