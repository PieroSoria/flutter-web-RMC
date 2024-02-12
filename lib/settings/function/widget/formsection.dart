import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/connection/api/section/getsection.dart';
import 'package:rmc_bussiness/controller/data/controller_products.dart';
import 'package:rmc_bussiness/interface/model/section.dart';
import 'package:rmc_bussiness/settings/function/controller/admin_controller.dart';
import 'package:rmc_bussiness/settings/function/widget/inputformcustom.dart';
import 'package:crypto/crypto.dart';

class FormSection extends StatefulWidget {
  final String id;
  const FormSection({super.key, required this.id});

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  final controlleradmin = Get.put(SettingsAdmin());
  final controllerproduct = Get.put(ControllerProducts());
  final getsection = GetSectionApi();

  List<String> sectionmode = [
    "Container",
    "Destacado",
    "Mas Vendidos",
    "Promocion",
    "Beneficio",
    "Diferencia",
    "Caracteristicas"
  ];
  final section = TextEditingController();
  final titulo = TextEditingController(text: '');
  final subtitulo = TextEditingController(text: '');
  final contenido = TextEditingController(text: "");
  final reves = TextEditingController(text: "");
  final nombreproduct = TextEditingController(text: "");
  final categoria = TextEditingController(text: "");
  final subcategoria = TextEditingController(text: "");
  final beneficios = TextEditingController(text: "");
  final caracteristicas = TextEditingController(text: "");
  final ancho = TextEditingController(text: "");
  final alto = TextEditingController(text: "");
  final usescroll = TextEditingController(text: "");

  final _keyform2 = GlobalKey<FormState>();

  @override
  void initState() {
    controlleradmin.sectionmodeide(sectionmode.first);
    super.initState();
  }

  bool usescrolls = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyform2,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(
                    () => Text(
                      "Inserte una nueva Section a ${controlleradmin.pageview.value}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "CenturyGothic",
                        fontSize: 25,
                      ),
                    ),
                  )),
              SizedBox(
                width: 300,
                child: Obx(
                  () => DropdownButton<String>(
                    value: controlleradmin.sectionmodeide.value,
                    style: const TextStyle(fontFamily: "Poppins", fontSize: 20),
                    borderRadius: BorderRadius.circular(10),
                    alignment: Alignment.center,
                    icon: const SizedBox.shrink(),
                    isExpanded: true,
                    items: sectionmode.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                            child: Text(
                          value,
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 20),
                        )),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        section.text = value ?? '';
                        controlleradmin.sectionmodeide(value);
                      });
                    },
                  ),
                ),
              ),
              Obx(() {
                switch (controlleradmin.sectionmodeide.value) {
                  case "Container":
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InputFormCustom(
                          controllerform: titulo,
                          width: 400,
                          height: 50,
                          titulo: 'Titulo del Section',
                        ),
                        InputFormCustom(
                          controllerform: subtitulo,
                          width: 400,
                          height: 50,
                          titulo: 'Subtitulo del section',
                        ),
                        // InputFormCustom(
                        //   controllerform: contenido,
                        //   width: 400,
                        //   height: 50,
                        //   titulo: 'Contenido del Section',
                        // ),
                        const Text(
                          "Contenido del Section",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 200,
                          child: TextField(
                            controller: contenido,
                            style: const TextStyle(fontSize: 18),
                            maxLines: 6,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                        ),
                        InputFormCustom(
                          controllerform: reves,
                          width: 400,
                          height: 50,
                          titulo: 'Cambiar de lados',
                        ),
                        InputFormCustom(
                          controllerform: nombreproduct,
                          width: 400,
                          height: 50,
                          titulo: 'Nombre de producto',
                        ),
                        InputFormCustom(
                          controllerform: ancho,
                          width: 400,
                          height: 50,
                          titulo: 'Ancho del section',
                        ),
                        InputFormCustom(
                          controllerform: alto,
                          width: 400,
                          height: 50,
                          titulo: 'alto del section',
                        ),
                      ],
                    );
                  case "Destacado":
                    return Column(
                      children: [
                        InputFormCustom(
                          controllerform: titulo,
                          width: 400,
                          height: 50,
                          titulo: 'Titulo del Section',
                        ),
                        InputFormCustom(
                          controllerform: categoria,
                          width: 400,
                          height: 50,
                          titulo: 'Categoria del producto',
                        ),
                        const Text(
                          "Usar Scroll",
                          style: TextStyle(fontFamily: "Poppins", fontSize: 16),
                        ),
                        Switch(
                          value: usescrolls,
                          onChanged: (bool newvalue) {
                            setState(() {
                              usescrolls = newvalue;
                              if (usescrolls) {
                                usescroll.text = "true";
                              } else {
                                usescroll.text = "false";
                              }
                            });
                          },
                        ),
                        InputFormCustom(
                          controllerform: ancho,
                          width: 400,
                          height: 50,
                          titulo: 'ancho del contexto',
                        ),
                        InputFormCustom(
                          controllerform: alto,
                          width: 400,
                          height: 50,
                          titulo: 'altura del contexto',
                        ),
                      ],
                    );
                  case "Mas Vendidos":
                    return Column(
                      children: [
                        InputFormCustom(
                          controllerform: titulo,
                          width: 400,
                          height: 50,
                          titulo: 'titulo del Section ',
                        ),
                        InputFormCustom(
                          controllerform: categoria,
                          width: 400,
                          height: 50,
                          titulo: 'Categoria del producto',
                        ),
                      ],
                    );
                  case "Promocion":
                    return Column(
                      children: [
                        InputFormCustom(
                          controllerform: titulo,
                          width: 400,
                          height: 50,
                          titulo: 'titulo del Section',
                        ),
                        // InputFormCustom(
                        //   controllerform: contenido,
                        //   width: 400,
                        //   height: 100,
                        //   titulo: 'Contenido del Section',
                        // ),
                        const Text(
                          "Contenido del Section",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 200,
                          child: TextField(
                            controller: contenido,
                            style: const TextStyle(fontSize: 18),
                            maxLines: 6,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                        ),
                        InputFormCustom(
                          controllerform: categoria,
                          width: 400,
                          height: 50,
                          titulo: 'Categoria del Producto',
                        ),
                      ],
                    );
                  case "Beneficio":
                    return Column(
                      children: [
                        InputFormCustom(
                          controllerform: titulo,
                          width: 400,
                          height: 50,
                          titulo: 'titulo del Section',
                        ),
                        // InputFormCustom(
                        //   controllerform: contenido,
                        //   width: 400,
                        //   height: 50,
                        //   titulo: 'Contenido del Section',
                        // ),
                        const Text(
                          "Contenido del Section",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 200,
                          child: TextField(
                            controller: contenido,
                            style: const TextStyle(fontSize: 18),
                            maxLines: 6,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                        ),
                        InputFormCustom(
                          controllerform: reves,
                          width: 400,
                          height: 50,
                          titulo: 'cambiar de lados',
                        ),
                        InputFormCustom(
                          controllerform: nombreproduct,
                          width: 400,
                          height: 50,
                          titulo: 'nombre del producto',
                        )
                      ],
                    );
                  case "Diferencia":
                    return Column(
                      children: [
                        InputFormCustom(
                          controllerform: titulo,
                          width: 400,
                          height: 50,
                          titulo: 'titulo del Section',
                        ),
                        // InputFormCustom(
                        //   controllerform: contenido,
                        //   width: 400,
                        //   height: 50,
                        //   titulo: 'Contenido del Section',
                        // ),
                        const Text(
                          "Contenido del Section",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 200,
                          child: TextField(
                            controller: contenido,
                            style: const TextStyle(fontSize: 18),
                            maxLines: 6,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                        ),
                        InputFormCustom(
                          controllerform: nombreproduct,
                          width: 400,
                          height: 50,
                          titulo: 'Nombre del Producto',
                        )
                      ],
                    );
                  case "Caracteristicas":
                    return Column(
                      children: [
                        InputFormCustom(
                          controllerform: titulo,
                          width: 400,
                          height: 50,
                          titulo: 'titulo del Section',
                        ),
                        // InputFormCustom(
                        //   controllerform: contenido,
                        //   width: 400,
                        //   height: 50,
                        //   titulo: 'Contenido del Section',
                        // ),
                        const Text(
                          "Contenido del Section",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 200,
                          child: TextField(
                            controller: contenido,
                            style: const TextStyle(fontSize: 18),
                            maxLines: 6,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                        ),
                        InputFormCustom(
                          controllerform: nombreproduct,
                          width: 400,
                          height: 50,
                          titulo: 'Nombre del Producto',
                        )
                      ],
                    );
                  default:
                    return const Center();
                }
              }),
              ElevatedButton(
                onPressed: () async {
                  widget.id != ""
                      ? await actualizardatos()
                      : await inserciondedatos();
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text(
                  widget.id != '' ? "Actualizar datos" : "Insertar Datos",
                  style: const TextStyle(
                    fontFamily: "CenturyGothic",
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> inserciondedatos() async {
    final products =
        await controllerproduct.getproductbynombre(nombreproduct.text);
    var id = utf8.encode(
        "${titulo.text}/${section.text}/${controlleradmin.pageview.value}");
    var idl = sha256.convert(id);
    final Section sections = Section(
      id: idl.toString(),
      section: controlleradmin.sectionmodeide.value,
      titulo: titulo.text,
      subtitulo: subtitulo.text,
      contenido: contenido.text,
      reves: reves.text,
      nombreProducto: nombreproduct.text,
      categoria:
          nombreproduct.text.isEmpty ? categoria.text : products.categoria,
      subcategoria: nombreproduct.text.isEmpty
          ? subcategoria.text
          : products.subcategoria,
      beneficios: beneficios.text,
      caracteristicas: caracteristicas.text,
      ancho: ancho.text,
      alto: alto.text,
      useScroll: usescroll.text,
      page: controlleradmin.pageview.value,
    );

    bool result = await getsection.createSectiondb(sections);
    if (result) {
      setState(() {
        section.text = '';
        titulo.text = '';
        subtitulo.text = '';
        contenido.text = '';
        reves.text = '';
        nombreproduct.text = '';
        categoria.text = '';
        subcategoria.text = '';
        beneficios.text = '';
        caracteristicas.text = '';
        ancho.text = '';
        alto.text = '';
        usescroll.text = '';
      });
      controlleradmin.refreshlistsection(controlleradmin.pageview.value);
      Get.snackbar("Exito", "Se envio los datos");
    } else {
      Get.snackbar("Opps!", "Error ");
    }
  }

  Future<void> actualizardatos() async {
    final products =
        await controllerproduct.getproductbynombre(nombreproduct.text);
    final Section sections = Section(
      id: widget.id,
      section: controlleradmin.sectionmodeide.value,
      titulo: titulo.text,
      subtitulo: subtitulo.text,
      contenido: contenido.text,
      reves: reves.text,
      nombreProducto: nombreproduct.text,
      categoria:
          nombreproduct.text.isEmpty ? categoria.text : products.categoria,
      subcategoria: nombreproduct.text.isEmpty
          ? subcategoria.text
          : products.subcategoria,
      beneficios: beneficios.text,
      caracteristicas: caracteristicas.text,
      ancho: ancho.text,
      alto: alto.text,
      useScroll: usescroll.text,
      page: controlleradmin.pageview.value,
    );
    bool result = await getsection.actualizaritemsection(sections);
    if (result) {
      setState(() {
        section.text = '';
        titulo.text = '';
        subtitulo.text = '';
        contenido.text = '';
        reves.text = '';
        nombreproduct.text = '';
        categoria.text = '';
        subcategoria.text = '';
        beneficios.text = '';
        caracteristicas.text = '';
        ancho.text = '';
        alto.text = '';
        usescroll.text = '';
      });
      controlleradmin.refreshlistsection(controlleradmin.pageview.value);
      Get.snackbar("Exito", "Se envio los datos");
    } else {
      Get.snackbar("Opps!", "Error ");
    }
  }
}
