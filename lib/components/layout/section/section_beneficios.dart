import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/widget/card_productmuestra.dart';

import '../../../controller/data/controller_products.dart';
import '../../../interface/model/products.dart';

class SectionBeneficios extends StatefulWidget {
  final String titulo;
  final List<String> datos;
  final bool reves;
  final Color background;
  final Products products;
  final VoidCallback funcion;
  const SectionBeneficios(
      {super.key,
      required this.titulo,
      required this.datos,
      required this.reves,
      required this.background,
      required this.funcion, required this.products});

  @override
  State<SectionBeneficios> createState() => _SectionBeneficiosState();
}

class _SectionBeneficiosState extends State<SectionBeneficios> {
  final controllerproduct = Get.put(ControllerProducts());


  @override
  void initState() {
    super.initState();
    
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.background,
      ),
      child: SizedBox(
        width: 1500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                widget.titulo,
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.reves
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SizedBox(
                          width: 300,
                          height: 350,
                          child: CardProductMuestra(
                            urlimagen: widget.products.urlimagen,
                            nombreproduct: widget.products.nombre,
                            namebutton: 'Leer mas',
                            funcion: () async {
                                bool resul = await controllerproduct
                                    .saveidbyproduct(widget.products);
                                if (resul) {
                                  Get.toNamed(
                                    '/Cardproduct',
                                  );
                                }
                              },
                            categoria: widget.products.categoria,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SizedBox(
                          width: 700,
                          height: 400,
                          child: Center(
                            child: ListView.builder(
                              itemCount: widget.datos.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Center(
                                    child: Text(
                                      widget.datos[index],
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                widget.reves
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SizedBox(
                          width: 700,
                          height: 400,
                          child: Center(
                            child: ListView.builder(
                              itemCount: widget.datos.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Center(
                                      child: Text(
                                    widget.datos[index],
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 16),
                                  )),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SizedBox(
                          width: 300,
                          height: 350,
                          child: CardProductMuestra(
                            urlimagen: widget.products.urlimagen,
                            nombreproduct: widget.products.nombre,
                            namebutton: 'leer mas',
                            funcion: () async {
                                bool resul = await controllerproduct
                                    .saveidbyproduct(widget.products);
                                if (resul) {
                                  Get.toNamed(
                                    '/Cardproduct',
                                  );
                                }
                              },
                            categoria: widget.products.categoria,
                          ),
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
