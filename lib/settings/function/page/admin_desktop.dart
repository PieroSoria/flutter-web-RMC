import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rmc_bussiness/settings/function/model/tilesection.dart';
import 'package:rmc_bussiness/settings/function/page/fondo.dart';
import 'package:rmc_bussiness/settings/function/page/vistadelossection.dart';
import 'package:rmc_bussiness/settings/function/widget/formsection.dart';

import '../controller/admin_controller.dart';
import '../widget/icontap.dart';

class AdminDesktop extends StatefulWidget {
  const AdminDesktop({super.key});

  @override
  State<AdminDesktop> createState() => _AdminDesktopState();
}

class _AdminDesktopState extends State<AdminDesktop> {
  final controlleradmin = Get.put(SettingsAdmin());

  TileSection selectmenu = sidemenus.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          const Fondo(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 40),
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: 250,
              decoration: BoxDecoration(
                color: const Color.fromARGB(143, 197, 197, 197),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...sidemenus.map(
                      (tilemenu) => IconTap(
                        funcion: () {
                          setState(() {
                            if (tilemenu == sidemenus[0]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            } else if (tilemenu == sidemenus[1]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            } else if (tilemenu == sidemenus[2]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            } else if (tilemenu == sidemenus[3]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            } else if (tilemenu == sidemenus[4]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            } else if (tilemenu == sidemenus[5]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            } else if (tilemenu == sidemenus[6]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            } else if (tilemenu == sidemenus[7]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            } else if (tilemenu == sidemenus[8]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            } else if (tilemenu == sidemenus[9]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            } else if (tilemenu == sidemenus[10]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            } else if (tilemenu == sidemenus[11]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            } else if (tilemenu == sidemenus[12]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            } else if (tilemenu == sidemenus[13]) {
                              controlleradmin.pageview(tilemenu.titulo);
                              controlleradmin
                                  .refreshlistsection(tilemenu.titulo);
                            }
                          });
                        },
                        titulo: tilemenu.titulo,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 350,
            bottom: 20,
            child: SizedBox(
              width: 500,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    child: const SingleChildScrollView(
                        child: FormSection(
                      id: '',
                    )),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 40),
              width: 1000,
              height: 900,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const VistadelosSection(),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconTap(
              funcion: () {
                Get.toNamed('/Productosmode');
              },
              titulo: "Productos",
            ),
          )
        ],
      ),
    );
  }
}
