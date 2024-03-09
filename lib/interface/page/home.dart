import 'package:flutter/material.dart';
import 'package:rmc_bussiness/components/layout/section/section_banner.dart';
import 'package:rmc_bussiness/components/layout/section/section_masvendidos.dart';
import 'package:rmc_bussiness/components/widget/button_icon_container.dart';

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
          SectionBanners(width: width, listaimagen: const [],),
          const ProductosDestacados(
            titulo: "Impresoras Destacadas",
            categoria: "Impresora",
            scroll: true,
            sizewidth: 1000,
            sizeheigth: 500,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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


