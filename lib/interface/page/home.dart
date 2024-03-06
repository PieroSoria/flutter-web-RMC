import 'package:flutter/material.dart';
import 'package:rmc_bussiness/components/layout/section/section_masvendidos.dart';
import 'package:rmc_bussiness/components/widget/button_icon_container.dart';
import 'package:rmc_bussiness/components/widget/buttonhover.dart';
import 'package:rmc_bussiness/components/widget/imagendesection.dart';
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
          const SizedBox(
            height: 500,
            child: TarjectScroll(
              crosaxiscount: 1,
              imagenrul: [
                "assets/image/deco2.png",
                "assets/image/deco2.png",
                "assets/image/deco2.png",
              ],
              paddingcontainer: EdgeInsets.symmetric(horizontal: 0),
              positop: 0,
              posileft: 0,
              posiright: 0,
              posibotom: 0,
              titleimagen: true,
              imagenheigth: 500,
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
          SizedBox(
            height: width > 1200 ? 700 : 300,
            child: Stack(
              children: [
                const Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ImagenSection(
                    imagenurl: "assets/image/sectionimage.png",
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  top: 360,
                  bottom: 10,
                  left: 80,
                  child: SizedBox(
                    width: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Distribuidor Mayorista de Tecnología para Puntos de Venta ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: "CenturyGothic",
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Contamos con una amplia variedad de productos de tecnología, desde lectores de códigos de barras hasta impresoras de etiquetas y más, todos diseñados para mejorar la eficiencia de tu negocio. Explora nuestro Catálogo: Descubre nuestra amplia gama de productos de tecnología para puntos de venta y encuentra las soluciones que tu negocio necesita. Contáctanos: ¡Estamos aquí para ayudarte! Ponte en contacto con nosotros para obtener más información sobre precios y disponibilidad.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: "CenturyGothic",
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 130,
                          child: ButtonHover(
                            funcion: () {},
                            titulo: "Me Interesa!",
                            ini: const Color.fromARGB(255, 0, 112, 192),
                            fin: Colors.white,
                            fontsize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SectionMasVendidos(
            categoria: 'productos',
            titulo: "Nuestros productos más vendidos",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              width: double.infinity,
              height: 700,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  const Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ImagenSection(
                      imagenurl: "assets/image/imagensection2.png",
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 200,
                    bottom: 20,
                    left: 120,
                    right: 1200,
                    child: SizedBox(
                      width: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Conoce nuestra capacitación online",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: "CenturyGothic",
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Amplía tus conocimientos y mejora tus habilidades con nuestros cursos especializados. Aprende sobre impresoras, puntos de venta y soluciones empresariales desde la comodidad de tu hogar u oficina. Nuestros expertos te guiarán para que saques el máximo provecho de nuestras herramientas y optimizar tus operaciones comerciales. ¡Inscríbete ahora y abre las puertas al crecimiento y la eficiencia!",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: "CenturyGothic",
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: ButtonHover(
                              funcion: () {},
                              titulo: "Quiero Capacitarme!!",
                              ini: const Color.fromARGB(255, 0, 112, 192),
                              fin: Colors.white,
                              fontsize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const FoorterPage()
        ],
      ),
    );
  }
}
