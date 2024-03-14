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
    return ButtonHover(
      funcion: widget.press,
      titulo: widget.titulo!,
      fin: const Color.fromARGB(255, 0, 112, 192),
      ini: Colors.white,
      fontsize: 16,
    );
  }
}
