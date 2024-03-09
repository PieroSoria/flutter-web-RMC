import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/settings/function/controller/admin_controller.dart';
import 'package:rmc_bussiness/settings/function/page/productos/agregarproductos.dart';
import 'package:rmc_bussiness/settings/function/page/productos/datoproducts.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  final controller = Get.put(SettingsAdmin());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/fondo.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: width > 600
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Agregarproductos(),
                  Container(
                    width: 1200,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 224, 224, 224),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Productos Obtenidos"),
                        Expanded(
                          child: FutureBuilder(
                            future: controller.getdataproducts(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
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
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const Agregarproductos(),
      ),
    );
  }
}

