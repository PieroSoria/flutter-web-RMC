import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rmc_bussiness/settings/function/controller/admin_controller.dart';

class VistadelosSection extends StatefulWidget {
  const VistadelosSection({super.key});

  @override
  State<VistadelosSection> createState() => _VistadelosSectionState();
}

class _VistadelosSectionState extends State<VistadelosSection> {
  final controlleradmin = Get.put(SettingsAdmin());

  // final Products _products = Products(
  //     id: 'id',
  //     nombre: 'nombre',
  //     comentario: 'comentario',
  //     description: 'description',
  //     categoria: 'categoria',
  //     subcategoria: 'subcategoria',
  //     precio: 'precio',
  //     puntaje: 'puntaje',
  //     vendidos: 'vendidos',
  //     urlimagen: 'urlimagen');

  @override
  void initState() {
    super.initState();
    controlleradmin.refreshlistsection(controlleradmin.pageview.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Obx(
            () => Text(
              "DATOS DE LA PAGINA ${controlleradmin.pageview.value}",
              style: const TextStyle(
                fontFamily: "CenturyGothic",
                fontSize: 30,
                color: Color.fromARGB(255, 0, 112, 192),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        child: Center(
          child: SizedBox(
            width: 600,
            child: Obx(() {
              if (controlleradmin.sectionactual.isEmpty) {
                return const Center(
                  child: Text(
                    "NO SE ENCONTRARON DATOS",
                    style: TextStyle(
                      fontFamily: "CenturyGothic",
                      fontSize: 35,
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: controlleradmin.sectionactual.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 127, 192),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  controlleradmin.sectionactual[index].id
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontFamily: "CenturyGothic",
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  controlleradmin.sectionactual[index].section
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: "CenturyGothic",
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              controlleradmin.sectionactual[index].producto !=
                                      null
                                  ? controlleradmin
                                      .sectionactual[index].producto!.nombre
                                  : "No se encontro ningun producto",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: "CenturyGothic",
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controlleradmin.index(index);
                              controlleradmin.sectionmodeide("Container");
                              Get.toNamed('/ActualizarSection');
                            },
                            child: const ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              child: Icon(
                                Icons.edit,
                                size: 45,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              eliminaritem(context, index);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ),
      ),
    );
  }

  Future<dynamic> eliminaritem(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              width: 300,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Seguro que desea Eliminar la seccion"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await controlleradmin.removeitemsection(
                              controlleradmin.sectionactual[index].id);
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop();
                        },
                        child: const Text("Aceptar"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancelar"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
