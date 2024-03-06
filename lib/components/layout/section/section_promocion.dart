import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/widget/tarject_scroll_products.dart';
import 'package:rmc_bussiness/controller/data/controller_products.dart';

class SectiondePromocion extends StatefulWidget {
  final String titulo;
  final String contenido;
  final String categoria;
  final Color background;
  const SectiondePromocion(
      {super.key,
      required this.titulo,
      required this.contenido,
      required this.background,
      required this.categoria});

  @override
  State<SectiondePromocion> createState() => _SectiondePromocionState();
}

class _SectiondePromocionState extends State<SectiondePromocion> {
  final controllerproducts = Get.put(ControllerProducts());
  @override
  Widget build(BuildContext context) {
    double wdith = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: widget.background),
      child: SizedBox(
        width: 1500,
        child: Column(
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: 800,
                child: Text(
                  widget.contenido,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 1500,
              height: 360,
              child: FutureBuilder(
                future: controllerproducts
                    .getDataProductMasVendidos(widget.categoria),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Text("CARGANDO"),
                    );
                  } else if (snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text("No se encontraron datos"),
                    );
                  } else {
                    final data = snapshot.data!;
                    return TarjectScrollProducts(
                      positop: 20,
                      posileft: 20,
                      posiright: 20,
                      posibotom: 20,
                      paddingcontainer:
                          const EdgeInsets.symmetric(horizontal: 20),
                      countitem: wdith > 900
                          ? 4
                          : wdith < 700
                              ? 2
                              : 3,
                      usobuton: true,
                      tipo: "terminal",
                      data: data,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
