import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/data/controller_products.dart';
import '../../widget/tarject_scroll_products.dart';

class SectionMasVendidos extends StatefulWidget {
  final String categoria;
  final String titulo;
  const SectionMasVendidos(
      {super.key, required this.categoria, required this.titulo});

  @override
  State<SectionMasVendidos> createState() => _SectionMasVendidosState();
}

class _SectionMasVendidosState extends State<SectionMasVendidos> {
  final controllerproduct = Get.put(ControllerProducts());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
          width: 1000,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  widget.titulo,
                  textAlign: TextAlign.center,
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
                        .getDataProductMasVendidos(widget.categoria),
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
                        return TarjectScrollProducts(
                          positop: 20,
                          posileft: 20,
                          posiright: 20,
                          posibotom: 20,
                          paddingcontainer:
                              const EdgeInsets.symmetric(horizontal: 5),
                          countitem: width > 690 ? 3 : 2,
                          usobuton: true,
                          
                          data: data,
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
