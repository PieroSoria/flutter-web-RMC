import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/layout/footer.dart';
import 'package:rmc_bussiness/components/layout/section/section_destacados.dart';
import 'package:rmc_bussiness/components/widget/butonhoverwhat.dart';
import 'package:rmc_bussiness/components/widget/imagendesection.dart';
import 'package:rmc_bussiness/connection/api/whatsapp/apiwhatsapp.dart';
import 'package:rmc_bussiness/controller/data/controller_products.dart';
import 'package:rmc_bussiness/interface/model/products.dart';

import '../layout/articulo/promociondeproduct.dart';

class CardProduct extends StatefulWidget {
  const CardProduct({super.key});

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  final controllerproducs = Get.put(ControllerProducts());
  @override
  void initState() {
    controllerproducs.onInit();
    super.initState();
  }

  @override
  void dispose() {
    controllerproducs.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Productos",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "CenturyGothic",
            fontSize: 50,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 112, 192),
        toolbarHeight: 80,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/fondo.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: FutureBuilder<Products?>(
            future: controllerproducs.getDataProductshared(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [CircularProgressIndicator(), Text("CARGANDO")],
                  ),
                );
              } else if (snapshot.data == null) {
                setState(() {
                  Get.back();
                });
                return const Center();
              } else {
                return Obx(() {
                  final data = controllerproducs.productoseleccionado.value;
                  return Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ImagenSection(
                                    imagenurl: data!.urlimagen,
                                    width: 300,
                                    height: 300,
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          data.nombre,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: "CenturyGothic",
                                            fontSize: 25,
                                            color: Color.fromARGB(
                                                255, 0, 112, 192),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 400,
                                          child: Text(
                                            data.comentario,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        BHoverIcon(
                                          funcion: () {
                                            final apiwhatsapp = ApiWhatsApp();
                                            apiwhatsapp.launchWhatsAppWeb(
                                                "981229283",
                                                "Buenas, quisiera mas informacion acerca del producto ${data.nombre}");
                                          },
                                          titulo:
                                              "Ordena Ahora por via WhatsApp",
                                          ini: const Color.fromARGB(
                                              255, 66, 231, 0),
                                          fin: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Promociondeproduct()
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 700,
                              decoration:
                                  BoxDecoration(color: Colors.grey[200]),
                              child: Center(
                                child: SizedBox(
                                  width: 700,
                                  child: Text(
                                    data.description,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: ProductosDestacados(
                                titulo: "Productos de la misma Categoria",
                                categoria: data.categoria,
                                scroll: true,
                                sizewidth:
                                    MediaQuery.of(context).size.width / 2,
                                sizeheigth:
                                    MediaQuery.of(context).size.height / 2,
                              ),
                            ),
                            const FoorterPage()
                          ],
                        ),
                      ),
                    ),
                  );
                });
              }
            },
          )),
    );
  }
}
