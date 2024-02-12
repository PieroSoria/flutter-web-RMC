import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/widget/buttonhover.dart';
import 'package:rmc_bussiness/components/widget/sidemenutile.dart';
import 'package:rmc_bussiness/controller/widget/selectwidget.dart';

import '../../interface/model/tile_assets.dart';

class Navbar extends StatefulWidget {
  final Widget currentWidget;
  final Function onselect;
  const Navbar(
      {super.key, required this.onselect, required this.currentWidget});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final controllerwidget = Get.put(WidgetController());
  Tileasset selectMenu = sideMenustile.first;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          child: ButtonHover(
            funcion: () {
              controllerwidget.indexwidget(0);
            },
            titulo: 'RMCBussines',
            ini: const Color.fromARGB(255, 255, 163, 52),
            fin: const Color.fromARGB(255, 0, 112, 192),
            fontsize: 20,
          ),
        ),
        SizedBox(
          width: 1400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...sideMenustile.map(
                (tilemenu) => SideMenuTile(
                  titulo: tilemenu.title,
                  dropmenuitem: tilemenu.dropdownItems,
                  press: () {
                    setState(() {
                      selectMenu = tilemenu;
                      widget.onselect(tilemenu);
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
