import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/settings/function/controller/admin_controller.dart';
import 'package:rmc_bussiness/settings/function/page/productos/datoproducts.dart';

class MostrarProductos extends StatefulWidget {
  const MostrarProductos({
    super.key,
  });

  @override
  State<MostrarProductos> createState() => _MostrarProductosState();
}

class _MostrarProductosState extends State<MostrarProductos> {
  final controller = Get.put(SettingsAdmin());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 224, 224, 224),
      ),
      child: FutureBuilder(
        future: controller.getdataproducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.listaproductos.isEmpty) {
            return const Center(
              child: Text("No se encontro ningun Dato"),
            );
          } else {
            return Obx(
              () => ListView.builder(
                itemCount: controller.listaproductos.length,
                itemBuilder: (context, index) {
                  return Datoproductos(
                    data: controller.listaproductos[index],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
