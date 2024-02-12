import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/data/controller_products.dart';
import '../../../interface/model/products.dart';
import '../../widget/card_productmuestra.dart';

class SectionDirefencia extends StatefulWidget {
  final String titulo;
  final String contenido;

  final String nombreproduct;

  final Color background;
  const SectionDirefencia(
      {super.key,
      required this.titulo,
      required this.contenido,
      required this.nombreproduct,
      required this.background});

  @override
  State<SectionDirefencia> createState() => _SectionDirefenciaState();
}

class _SectionDirefenciaState extends State<SectionDirefencia> {
  final controllerproduct = Get.put(ControllerProducts());
  Products? products;

  @override
  void initState() {
    super.initState();
    inicializar();
  }

  Future<void> inicializar() async {
    products =
        await controllerproduct.getproductbynombre(widget.nombreproduct);
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
                                  child: Text("Código de Barra Oficial"),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text("Código de Barra Pirata"),
                                ),
                              ),
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
                      urlimagen: products!.urlimagen,
                      nombreproduct: widget.nombreproduct,
                      namebutton: "Leer mas",
                      funcion: () {},
                      categoria: products!.categoria,
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
