import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/widget/card_productmuestra.dart';
import 'package:rmc_bussiness/controller/data/controller_products.dart';
import 'package:rmc_bussiness/interface/model/products.dart';

class SectionContainer extends StatefulWidget {
  final String titulo;
  final String subtitulo;
  final String contenido;
  final bool reves;
  final Color background;
  final Products product;

  final VoidCallback funcion;
  const SectionContainer({
    super.key,
    required this.titulo,
    required this.contenido,
    required this.reves,
    required this.subtitulo,
    required this.background,
    required this.product,
    required this.funcion,
  });

  @override
  State<SectionContainer> createState() => _SectionContainerState();
}

class _SectionContainerState extends State<SectionContainer> {
  final controllerproduct = Get.put(ControllerProducts());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.background,
      ),
      child: Center(
        child: SizedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  widget.titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "CenturyGothic",
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  widget.subtitulo,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontFamily: "CenturyGothic",
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              width > 1200
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.reves
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: SizedBox(
                                  width: 600,
                                  child: Text(
                                    widget.contenido,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 17),
                                  ),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: SizedBox(
                                  width: 300,
                                  height: 350,
                                  child: CardProductMuestra(
                                    urlimagen: widget.product.urlimagen
                                        .toString()
                                        .split(',')
                                        .first,
                                    nombreproduct: widget.product.nombre,
                                    namebutton: "Leer Mas",
                                    funcion: () async {
                                      bool resul = await controllerproduct
                                          .saveidbyproduct(widget.product);
                                      if (resul) {
                                        Get.toNamed(
                                          '/Cardproduct',
                                        );
                                      }
                                    },
                                    categoria: widget.product.categoria,
                                  ),
                                ),
                              ),
                        widget.reves
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: SizedBox(
                                  width: 300,
                                  height: 350,
                                  child: CardProductMuestra(
                                    urlimagen: widget.product.urlimagen,
                                    nombreproduct: widget.product.nombre,
                                    namebutton: "Leer Mas",
                                    funcion: widget.funcion,
                                    categoria: widget.product.categoria,
                                  ),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: SizedBox(
                                  width: 600,
                                  child: Text(
                                    widget.contenido,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ),
                              )
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: SizedBox(
                            width: 600,
                            child: Text(
                              widget.contenido,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: SizedBox(
                            width: 300,
                            height: 350,
                            child: CardProductMuestra(
                              urlimagen: widget.product.urlimagen
                                  .toString()
                                  .split(',')
                                  .first,
                              nombreproduct: widget.product.nombre,
                              namebutton: "Leer Mas",
                              funcion: () async {
                                bool resul = await controllerproduct
                                    .saveidbyproduct(widget.product);
                                if (resul) {
                                  Get.toNamed(
                                    '/Cardproduct',
                                  );
                                }
                              },
                              categoria: widget.product.categoria,
                            ),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
