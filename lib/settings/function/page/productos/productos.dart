import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/settings/function/controller/admin_controller.dart';
import 'package:rmc_bussiness/settings/function/page/fondo.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Fondo(),
          const Positioned(
            top: 20,
            left: 20,
            bottom: 20,
            child: Agregarproductos(),
          ),
          Positioned(
            top: 20,
            bottom: 20,
            right: 20,
            child: Container(
              width: 1200,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 224, 224, 224),
              ),
              child: Column(
                children: [
                  const Text("Productos Obtenidos"),
                  Expanded(
                    flex: 5,
                    child: FutureBuilder(
                      future: controller.getdataproducts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.data == null) {
                          return const Center(
                            child: Text("No se encontro ningun Dato"),
                          );
                        } else {
                          final data = snapshot.data!;
                          return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Datoproductos(
                                data: data[index],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
