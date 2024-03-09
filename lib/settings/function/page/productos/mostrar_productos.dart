import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/settings/function/controller/admin_controller.dart';
import 'package:rmc_bussiness/settings/function/page/productos/dataproducto_id_detalle.dart';
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lista de Productos",
          style: TextStyle(
            fontFamily: "CenturyGothic",
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
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
                    return width > 600
                        ? Datoproductos(
                            data: controller.listaproductos[index],
                          )
                        : Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            child: ListTile(
                              title:
                                  Text(controller.listaproductos[index].nombre),
                              subtitle: Text(
                                  controller.listaproductos[index].categoria),
                              onTap: () {
                                Get.to(
                                  () => DetalleProductoId(
                                    data: controller.listaproductos[index],
                                  ),
                                );
                              },
                            ),
                          );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
