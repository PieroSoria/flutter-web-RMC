import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rmc_bussiness/settings/function/model/tilesection.dart';
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: IconTap(
        funcion: () {
          Get.toNamed('/Productosmode');
        },
        titulo: "Productos",
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/fondo.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: width > 600
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    width: 250,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(143, 197, 197, 197),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
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
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 500,
                    height: 900,
                    child: const SingleChildScrollView(
                      child: FormSection(
                        id: '',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 40),
                    width: 1000,
                    height: 900,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const VistadelosSection(),
                  ),
                ],
              )
            : ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    width: 250,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(143, 197, 197, 197),
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    child: const FormSection(
                      id: '',
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const VistadelosSection(),
                  ),
                ],
              ),
      ),
    );
  }
}
