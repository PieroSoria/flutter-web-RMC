import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/interface/model/products.dart';

import '../../../controller/data/controller_products.dart';

class Promociondeproduct extends StatefulWidget {
  const Promociondeproduct({
    super.key,
  });

  @override
  State<Promociondeproduct> createState() => _PromociondeproductState();
}

class _PromociondeproductState extends State<Promociondeproduct> {
  final controllerproduct = Get.put(ControllerProducts());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 340,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Productos mas Vendidos",
            style: TextStyle(
                fontFamily: "CenturyGothic",
                fontSize: 20,
                color: Color.fromARGB(255, 0, 112, 192)),
          ),
          Container(
            width: 300,
            height: 300,
            decoration: const BoxDecoration(),
            child: FutureBuilder<List<Products>>(
              future: controllerproduct.getDataProductMasVendidos("productos"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Text("Cargando"),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No se encontraron los Datos"),
                  );
                } else {
                  return ListView.builder(
                    itemCount:
                        snapshot.data!.length > 4 ? 4 : snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          snapshot.data![index].nombre,
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          snapshot.data![index].puntaje,
                          textAlign: TextAlign.center,
                        ),
                        leading: Image.network(
                          snapshot.data![index].urlimagen,
                          width: 100,
                          height: 100,
                        ),
                        onTap: () async {
                          bool resul = await controllerproduct
                              .saveidbyproduct(snapshot.data![index]);
                          if (resul) {
                            Get.toNamed(
                              '/Cardproduct',
                            );
                          }
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
