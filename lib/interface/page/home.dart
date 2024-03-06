import 'package:flutter/material.dart';
import 'package:rmc_bussiness/components/layout/section/section_masvendidos.dart';
import 'package:rmc_bussiness/components/widget/button_icon_container.dart';
import 'package:rmc_bussiness/components/widget/tarjectscroll.dart';

import '../../components/layout/footer.dart';
import '../../components/layout/section/section_destacados.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: width > 600 ? 500 : 200,
            child: TarjectScroll(
              crosaxiscount: 1,
              imagenrul: [
                "assets/image/deco2.png",
                "assets/image/deco2.png",
                "assets/image/deco2.png",
              ],
              paddingcontainer: const EdgeInsets.symmetric(horizontal: 0),
              positop: 0,
              posileft: 0,
              posiright: 0,
              posibotom: 0,
              imagenheigth: width > 600 ? 500 : 200,
              usobuton: true,
            ),
          ),
          const ProductosDestacados(
            titulo: "Impresoras Destacadas",
            categoria: "Impresora",
            scroll: true,
            sizewidth: 1000,
            sizeheigth: 500,
          ),
          Container(
            decoration: const BoxDecoration(),
            child: Center(
              child: SizedBox(
                width: 700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "NUESTRAS CATEGORIAS",
                        style: TextStyle(
                          fontFamily: "CenturyGothic",
                          fontSize: 25,
                          color: Color.fromARGB(255, 0, 112, 192),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonIconContainer(
                          titulo: 'Terminal',
                          fontsize: 18,
                          funcion: () {},
                          ini: const Color.fromARGB(255, 0, 112, 192),
                          fin: Colors.white,
                          icon: const Icon(
                            Icons.computer,
                            color: Colors.amber,
                            size: 80,
                          ),
                        ),
                        ButtonIconContainer(
                          titulo: 'Lector',
                          fontsize: 18,
                          funcion: () {},
                          ini: const Color.fromARGB(255, 0, 112, 192),
                          fin: Colors.white,
                          icon: const Icon(
                            Icons.qr_code_2_rounded,
                            color: Colors.amber,
                            size: 80,
                          ),
                        ),
                        ButtonIconContainer(
                          titulo: 'Impresora',
                          fontsize: 18,
                          funcion: () {},
                          ini: const Color.fromARGB(255, 0, 112, 192),
                          fin: Colors.white,
                          icon: const Icon(
                            Icons.print_outlined,
                            color: Colors.amber,
                            size: 80,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const ProductosDestacados(
            titulo: "Productos destacados",
            categoria: 'productos',
            scroll: false,
            sizewidth: 1200,
            sizeheigth: 850,
          ),
          const SectionMasVendidos(
            categoria: 'productos',
            titulo: "Nuestros productos más vendidos",
          ),
          const FoorterPage()
        ],
      ),
    );
  }
}
