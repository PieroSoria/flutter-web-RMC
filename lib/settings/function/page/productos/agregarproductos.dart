import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/settings/function/controller/admin_controller.dart';
import 'package:rmc_bussiness/settings/function/page/productos/datoproducts.dart';
import 'package:rmc_bussiness/settings/function/widget/lista_de_opcion_desplegable.dart';
import 'package:rmc_bussiness/settings/function/widget/multi_imagenes.dart';
import 'package:rmc_bussiness/settings/routes/routes.dart';

class Agregarproductos extends StatefulWidget {
  const Agregarproductos({super.key});

  @override
  State<Agregarproductos> createState() => _AgregarproductosState();
}

class _AgregarproductosState extends State<Agregarproductos> {
  final controller = Get.put(SettingsAdmin());
  final nombre = TextEditingController();
  final categoria = TextEditingController();
  final description = TextEditingController();
  final subcategoria = TextEditingController();
  final comentarios = TextEditingController();
  final preciopublico = TextEditingController();
  final precioreseller = TextEditingController();
  final puntaje = TextEditingController();
  final vendidos = TextEditingController();
  final urlpdf = TextEditingController();
  final urlyoutube = TextEditingController();

  List<String>? listadedescripcion = [];

  @override
  void initState() {
    controller.onStart();
    super.initState();
  }

  @override
  void dispose() {
    controller.onDelete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 254, 254),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            width < 600
                ? Card(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.admindesktop);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const Text(
                          "Agregar un Nuevo Producto",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "CenturyGothic",
                          ),
                        ),
                      ],
                    ),
                  )
                : const Text(
                    "Agregar un Nuevo Producto",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "CenturyGothic",
                    ),
                  ),
            InputformProducts(
              controller: nombre,
              width: 400,
              titulo: 'nombre del producto',
            ),
            SizedBox(
              width: 400,
              child: ListaDedescripcion(
                titulo: 'Agrega Descripcion',
                press: () {
                  setState(() {
                    listadedescripcion!.add(description.text);
                    description.clear();
                  });
                },
                dropmenuitem: listadedescripcion,
                controller: description,
                pressedit: (int index) {
                  setState(() {
                    listadedescripcion!.removeAt(index);
                  });
                },
              ),
            ),
            InputformProducts(
              controller: categoria,
              width: 400,
              titulo: 'categoria del producto',
            ),
            InputformProducts(
              controller: subcategoria,
              width: 400,
              titulo: 'subcategoria del producto',
            ),
            InputformProducts(
              controller: comentarios,
              width: 400,
              titulo: 'comentarios del producto',
            ),
            InputformProducts(
              controller: preciopublico,
              width: 400,
              titulo: 'precio publico del producto',
            ),
            InputformProducts(
              controller: precioreseller,
              width: 400,
              titulo: 'precio reseller del producto',
            ),
            InputformProducts(
              controller: puntaje,
              width: 400,
              titulo: 'puntaje del producto',
            ),
            InputformProducts(
              controller: vendidos,
              width: 400,
              titulo: 'cantidad de veces que el producto fue vendido',
            ),
            InputformProducts(
              controller: urlpdf,
              width: 400,
              titulo: 'url para el pdf del producto',
            ),
            InputformProducts(
              controller: urlyoutube,
              width: 400,
              titulo: 'url para el video del producto',
            ),
            SizedBox(
              width: 500,
              height: 600,
              child: MultiImagenes(
                press: () async {
                  await controller.capturarimagen();
                  controller.changeitems();
                },
                items: controller.items,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  width < 1730
                      ? ElevatedButton(
                          onPressed: () async {
                            Get.toNamed(Routes.mostrarproducto);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text("Mostrar productos"),
                        )
                      : const SizedBox.shrink(),
                  ElevatedButton(
                    onPressed: () async {
                      final imageUrl = await controller.getproductos
                          .subirMultiplesImagenesProductos(
                              multiImagenes: controller.listadeimagenes);
                      final data = {
                        'nombre': nombre.text,
                        'description': listadedescripcion!.join('/').toString(),
                        'comentario': comentarios.text,
                        'categoria': categoria.text,
                        'subcategoria': subcategoria.text,
                        'preciopublico': preciopublico.text,
                        'precioreseller': precioreseller.text,
                        'puntaje': puntaje.text,
                        'vendidos': vendidos.text,
                        'urlpdf': urlpdf.text,
                        'urlimagen': imageUrl?.join(',').toString() ??
                            "assets/icons2/galeria-de-imagenes.png",
                        'urlyoutube': urlyoutube.text,
                      };
                      await controller.agregarnuevoproducto(data);
                      setState(() {
                        nombre.text = "";
                        description.text = "";
                        comentarios.text = "";
                        categoria.text = "";
                        subcategoria.text = "";
                        preciopublico.text = "";
                        precioreseller.text = "";
                        puntaje.text = "";
                        vendidos.text = "";
                        urlpdf.text = "";
                        controller.imagecapturada(null);
                        controller.listadeimagenes.clear();
                        controller.items.clear();
                        listadedescripcion!.clear();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text("Agregar Producto"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
