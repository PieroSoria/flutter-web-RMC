import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/widget/card_productmuestra.dart';
import 'package:rmc_bussiness/components/widget/imagendesection.dart';
import 'package:rmc_bussiness/controller/data/controller_imagen_data.dart';

import 'buttonhover.dart';

class ContentTarjectScroll extends StatefulWidget {
  final int index;
  final bool data;
  final double imagenheight;
  final List<String> imagenurl;
  const ContentTarjectScroll(
      {super.key,
      required this.index,
      required this.data,
      required this.imagenheight,
      required this.imagenurl});

  @override
  State<ContentTarjectScroll> createState() => _ContentTarjectScrollState();
}

class _ContentTarjectScrollState extends State<ContentTarjectScroll> {
  final controllerimagen = Get.put(ControllerImagen());

  @override
  void initState() {
    widget.data
        ? controllerimagen.agregarimagensection(widget.imagenurl)
        : controllerimagen.agregarimagenproduct(widget.imagenurl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.imagenheight,
      decoration: const BoxDecoration(),
      child: widget.data
          ? Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Obx(
                    () => ImagenSection(
                      imagenurl:
                          controllerimagen.imagenlistsection[widget.index],
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 700,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                          right: Radius.elliptical(400, 400)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 500,
                          child: Text(
                            "Terminales de punto de venta SUNMI",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "CenturyGothic",
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 500,
                          child: Text(
                            "Con un enfoque en la tecnologia tactil y una interfaz de usuario intuitiva. Los terminales SUNMI facilitan las operaciones diarias, mejorar la interaccion con el cliente y aumenta la eficiencia operativa",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: ButtonHover(
                            funcion: () {},
                            titulo: "Ver Mas",
                            ini: const Color.fromARGB(255, 0, 112, 192),
                            fin: Colors.white,
                            fontsize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          : CardProductMuestra(
              urlimagen: controllerimagen.imagenlistproduct[widget.index],
              nombreproduct: "Basic 230 Style",
              namebutton: 'leer mas',
              funcion: () {
                
              }, categoria: 'asdasdasd',
            ),
    );
  }
}
