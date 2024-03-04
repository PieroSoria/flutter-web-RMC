import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/widget/card_productmuestra.dart';
import 'package:rmc_bussiness/components/widget/tarject_scroll_products.dart';

import '../../../controller/data/controller_products.dart';

class ProductosDestacados extends StatefulWidget {
  final String titulo;
  final String categoria;
  final bool scroll;
  final double sizewidth;
  final double sizeheigth;
  const ProductosDestacados({
    super.key,
    required this.titulo,
    required this.categoria,
    required this.scroll,
    required this.sizewidth,
    required this.sizeheigth,
  });

  @override
  State<ProductosDestacados> createState() => _ProductosDestacadosState();
}

class _ProductosDestacadosState extends State<ProductosDestacados> {
  final controllerproduct = Get.put(ControllerProducts());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 212, 212, 212),
        ),
      ),
      child: Center(
        child: SizedBox(
          width: widget.sizewidth,
          height: widget.sizeheigth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  widget.titulo,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontFamily: "CenturyGothic",
                    color: Colors.black,
                    fontSize: 35,
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: controllerproduct
                      .getDataProductdestacable(widget.categoria),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Text("Cargando"),
                      );
                    } else if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("No se encontro nada"),
                      );
                    } else {
                      final data = snapshot.data!;
                      if (widget.scroll) {
                        return TarjectScrollProducts(
                          positop: 20,
                          posileft: 20,
                          posiright: 20,
                          posibotom: 20,
                          paddingcontainer:
                              const EdgeInsets.symmetric(horizontal: 5),
                          countitem: 3,
                          usobuton: true,
                          tipo: 'destacable',
                          data: data,
                        );
                      } else {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 16,
                            mainAxisExtent: 350,
                          ),
                          shrinkWrap: true,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return CardProductMuestra(
                              urlimagen: data[index].urlimagen,
                              nombreproduct: data[index].nombre,
                              namebutton: 'leer mas',
                              funcion: () async {
                                bool resul = await controllerproduct
                                    .saveidbyproduct(data[index]);
                                if (resul) {
                                  Get.toNamed(
                                    '/Cardproduct',
                                  );
                                }
                              },
                              categoria: data[index].categoria,
                            );
                          },
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
