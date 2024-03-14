import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rmc_bussiness/components/layout/navbar.dart';
import 'package:rmc_bussiness/controller/widget/selectwidget.dart';
import 'package:rmc_bussiness/interface/page/home.dart';

import '../../components/widget/formcontacto.dart';
import '../model/tile_assets.dart';
import 'puntoventa/deescritorio.dart';
import 'puntoventa/demovil.dart';
import 'impresoras/imprcodbarra.dart';
import 'impresoras/impresoras.dart';
import 'impresoras/impresortermicadeticket.dart';
import 'impresoras/imprtermicaportatil.dart';
import 'lectorcodbarra.dart';
import 'puntoventa/puntdeventa.dart';
import 'quioscodeautoservicio.dart';
import 'soluciones/almacen_e_inventario.dart';
import 'soluciones/autoservicio.dart';
import 'soluciones/restaurante.dart';
import 'soluciones/soluciones.dart';
import 'soluciones/soluciones_retails.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final controllerwidget = Get.put(WidgetController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Widget _currentwidget;
  late Tileasset selectMenu;

  @override
  void initState() {
    selectMenu = sideMenustile.first;
    _currentwidget = const Home(
      pageview: 'Home',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        key: _scaffoldKey,
        backgroundColor: const Color.fromARGB(255, 0, 112, 192),
        iconTheme: const IconThemeData(color: Colors.white),
        title: width < 1220
            ? const Text(
                "RMC Solutions & Business",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "CenturyGothic",
                  fontSize: 30,
                ),
              )
            : Navbar(
                currentWidget: _currentwidget,
                onselect: (menu) {
                  setState(
                    () {
                      selectMenu = menu;
                      if (selectMenu == sideMenustile.first) {
                        controllerwidget.indexwidget(1);
                      } else if (selectMenu == sideMenustile[1]) {
                        controllerwidget.indexwidget(6);
                      } else if (selectMenu == sideMenustile[2]) {
                        controllerwidget.indexwidget(9);
                      } else if (selectMenu == sideMenustile[3]) {
                        controllerwidget.indexwidget(10);
                      } else if (selectMenu == sideMenustile[4]) {
                        controllerwidget.indexwidget(14);
                      } else if (selectMenu == sideMenustile[5]) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Dialog(
                              child: FormContacto(),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
      ),
      endDrawer: width < 1220
          ? Drawer(
              width: width / 1.5,
              backgroundColor: Colors.white,
              child: Navbar(
                currentWidget: _currentwidget,
                onselect: (menu) {
                  setState(
                    () {
                      selectMenu = menu;
                      if (selectMenu == sideMenustile[2]) {
                        controllerwidget.futuresection.clear();
                        controllerwidget.indexwidget(9);
                      } else if (selectMenu == sideMenustile[4]) {
                        controllerwidget.futuresection.clear();
                        controllerwidget.indexwidget(14);
                      } else if (selectMenu == sideMenustile[5]) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Dialog(
                              child: FormContacto(),
                            );
                          },
                        );
                      }
                    },
                  );
                  Scaffold.of(context).closeEndDrawer();
                },
                columna: true,
              ),
            )
          : null,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Obx(() {
          if (controllerwidget.indexwidget.value == 0) {
            return const Home(
              pageview: 'Home',
            );
          } else if (controllerwidget.indexwidget.value == 1) {
            return const SolucionesScreen(
              pageview: 'Soluciones',
            );
          } else if (controllerwidget.indexwidget.value == 2) {
            return const SolucionesRetails(
              pageview: 'Retails',
            );
          } else if (controllerwidget.indexwidget.value == 3) {
            return const RestauranteScreen(
              pageview: 'Restaurantes',
            );
          } else if (controllerwidget.indexwidget.value == 4) {
            return const AutoServicio(
              pageview: 'Autoservicio',
            );
          } else if (controllerwidget.indexwidget.value == 5) {
            return const AlmaceneInventario(
              pageview: 'Almacen e inventarios',
            );
          } else if (controllerwidget.indexwidget.value == 6) {
            return const PuntodeVenta(
              pageview: 'Punto de Venta',
            );
          } else if (controllerwidget.indexwidget.value == 7) {
            return const DeEscritorio(
              pageview: 'De escritorio',
            );
          } else if (controllerwidget.indexwidget.value == 8) {
            return const DeMovil(
              pageview: 'Movil',
            );
          } else if (controllerwidget.indexwidget.value == 9) {
            return const LectorCodBarra(
              pageview: 'Lectores de Barra',
            );
          } else if (controllerwidget.indexwidget.value == 10) {
            return const ImpresorasScreen(
              pageview: 'Impresoras',
            );
          } else if (controllerwidget.indexwidget.value == 11) {
            return const ImprTermicaTicket(
              pageview: 'Impresora termica tikec',
            );
          } else if (controllerwidget.indexwidget.value == 12) {
            return const ImprCodBarra(
              pageview: 'Impresora codigo de barra',
            );
          } else if (controllerwidget.indexwidget.value == 13) {
            return const ImprTermicaPortatil(
              pageview: 'Impresora termica portatil',
            );
          } else {
            return const Quiosco(
              pageview: 'Quiosco',
            );
          }
        }),
      ),
    );
  }
}
