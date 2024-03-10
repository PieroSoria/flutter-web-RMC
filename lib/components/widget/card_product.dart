import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/layout/footer.dart';
import 'package:rmc_bussiness/components/layout/section/section_destacados.dart';
import 'package:rmc_bussiness/components/widget/butonhoverwhat.dart';
import 'package:rmc_bussiness/connection/api/whatsapp/apiwhatsapp.dart';
import 'package:rmc_bussiness/controller/data/controller_products.dart';
import 'package:rmc_bussiness/interface/model/products.dart';
import 'package:rmc_bussiness/settings/function/widget/multi_imagen_network.dart';
import 'package:rmc_bussiness/settings/routes/routes.dart';

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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Obx(
          () => Text(
            "Producto ${controllerproducs.nombreproducto.value}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "CenturyGothic",
              fontSize: width < 600 ? 20 : 50,
              color: Colors.white,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.index);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
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
                  List<String> items =
                      data!.urlimagen.toString().split(',').toList();
                  debugPrint(items.toString());
                  return Center(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: width < 600
                                  ? Column(
                                      children: [
                                        MultiImagenes2(
                                          press: () {},
                                          string: true,
                                          itemsnew: null,
                                          items: items,
                                          button: false,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2,
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
                                                  data.comentario != ""
                                                      ? data.comentario
                                                      : "No se encontraron comentarios",
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              BHoverIcon(
                                                funcion: () {
                                                  final apiwhatsapp =
                                                      ApiWhatsApp();
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
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        MultiImagenes2(
                                          press: () {},
                                          string: true,
                                          itemsnew: null,
                                          items: items,
                                          button: false,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2,
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
                                                  data.comentario != ""
                                                      ? data.comentario
                                                      : "No se encontraron comentarios",
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              BHoverIcon(
                                                funcion: () {
                                                  final apiwhatsapp =
                                                      ApiWhatsApp();
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
                              decoration:
                                  BoxDecoration(color: Colors.grey[200]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Text(
                                      "Descripcion del Producto",
                                      style: TextStyle(
                                        fontFamily: "CenturyGothic",
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ...controllerproducs.listadedescripcion
                                          .map(
                                        (e) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Center(
                                            child: Text(
                                              e,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: ProductosDestacados(
                                titulo: "Productos de la misma Categoria",
                                categoria: data.categoria,
                                scroll: true,
                                sizewidth: 1000,
                                sizeheigth: 500,
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
