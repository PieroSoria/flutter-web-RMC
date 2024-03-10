import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/widget/card_productmuestra.dart';

import '../../../controller/data/controller_products.dart';
import '../../../interface/model/products.dart';

class CaracteristicasdeProduct extends StatefulWidget {
  final String titulo;
  final String contenido;
  final Products product;
  final Color background;

  const CaracteristicasdeProduct({
    super.key,
    required this.titulo,
    required this.contenido,
    required this.background,
    required this.product,
  });

  @override
  State<CaracteristicasdeProduct> createState() =>
      _CaracteristicasdeProductState();
}

class _CaracteristicasdeProductState extends State<CaracteristicasdeProduct> {
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
        width: 800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: 900,
                        child: Text(
                          widget.contenido,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 900,
                      child: Table(
                        border: TableBorder.all(color: Colors.white30),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          const TableRow(
                            decoration: BoxDecoration(color: Colors.red),
                            children: [
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text("Caracteristicas"),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text("Modelo Basico"),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text("Modelo Intermedio"),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text("Modelo Avanzado"),
                                ),
                              )
                            ],
                          ),
                          ...List.generate(
                            7,
                            (index) => TableRow(
                              decoration: const BoxDecoration(),
                              children: [
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text("hola $index"),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text("hola $index"),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text("hola $index"),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text("hola $index"),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: 300,
                    height: 350,
                    child: CardProductMuestra(
                      urlimagen:
                          widget.product.urlimagen.toString().split(',').first,
                      nombreproduct: widget.product.nombre,
                      namebutton: "Leer mas",
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
