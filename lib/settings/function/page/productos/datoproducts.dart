import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/interface/model/products.dart';
import 'package:rmc_bussiness/settings/function/controller/admin_controller.dart';
import 'package:rmc_bussiness/settings/function/widget/lista_de_opcion_desplegable.dart';

class Datoproductos extends StatefulWidget {
  final Products data;
  const Datoproductos({super.key, required this.data});

  @override
  State<Datoproductos> createState() => _DatoproductosState();
}

class _DatoproductosState extends State<Datoproductos> {
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
  String? imagenurldata;
  final urlpdf = TextEditingController();
  final urlyoutube = TextEditingController();
  List<String>? listadedescripcion = [];

  @override
  void initState() {
    nombre.text = widget.data.nombre;
    categoria.text = widget.data.categoria;
    listadedescripcion = widget.data.description.toString().split('/');
    subcategoria.text = widget.data.subcategoria;
    comentarios.text = widget.data.comentario;
    urlpdf.text = widget.data.urlpdf;
    preciopublico.text = widget.data.preciopublico;
    precioreseller.text = widget.data.precioreseller;
    puntaje.text = widget.data.puntaje;
    vendidos.text = widget.data.vendidos;
    imagenurldata = widget.data.urlimagen;
    urlyoutube.text = widget.data.urlyoutube;
    super.initState();
  }

  @override
  void dispose() {
    nombre.clear();
    categoria.clear();
    description.clear();
    subcategoria.clear();
    comentarios.clear();
    listadedescripcion!.clear();
    urlpdf.clear();
    preciopublico.clear();
    precioreseller.clear();
    puntaje.clear();
    vendidos.clear();
    imagenurldata = '';
    urlyoutube.clear();
    controller.onDelete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    debugPrint(width.toString());
    return Container(
        margin: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: width > 600 ? 10 : 20,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: width > 600 ? 10 : 10,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width > 600 ? 40 : 10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputformProducts(
                  controller: nombre,
                  width: 400,
                  titulo: 'nombre del producto',
                ),
                SizedBox(
                  width: 400,
                  child: ListaDedescripcion(
                    press: () {
                      setState(() {
                        if (description.text != "") {
                          listadedescripcion!.add(description.text);
                          description.clear();
                        }
                      });
                    },
                    dropmenuitem: listadedescripcion,
                    controller: description,
                    pressedit: (int index) {
                      setState(() {
                        listadedescripcion!.removeAt(index);
                      });
                    },
                    titulo: 'Agrega Descripcion',
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
                  controller: vendidos,
                  width: 400,
                  titulo: 'cantidad de veces que el producto fue vendido',
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                imagenurldata != "icons2/galeria-de-imagenes.png"
                    ? GestureDetector(
                        onTap: () {
                          controller.capturarimagen2();
                        },
                        child: Image.network(
                          imagenurldata!,
                          width: 300,
                          height: 300,
                          fit: BoxFit.fill,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.capturarimagen2();
                        },
                        child: Obx(
                          () => Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: controller.imagecapturada2.value != null
                                    ? MemoryImage(
                                            controller.imagecapturada2.value!)
                                        as ImageProvider
                                    : const AssetImage(
                                        'icons2/galeria-de-imagenes.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                InputformProducts(
                  controller: urlpdf,
                  width: 400,
                  titulo: 'url para el pdf del producto',
                ),
                InputformProducts(
                  controller: urlyoutube,
                  width: 400,
                  titulo: "url para el video del producto",
                ),
                InputformProducts(
                  controller: puntaje,
                  width: 400,
                  titulo: 'puntaje del producto',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (controller.imagecapturada2.value != null &&
                              controller.nombredelaimagen2.value != "") {
                            final String? imageUrl = await controller
                                .getproductos
                                .subirimagenproducto(
                                    archivo: controller.imagecapturada2.value!,
                                    nombreimagen:
                                        controller.nombredelaimagen2.value);
                            final data = {
                              'id': widget.data.id,
                              'nombre': nombre.text,
                              'description':
                                  listadedescripcion!.join('/').toString(),
                              'comentario': comentarios.text,
                              'categoria': categoria.text,
                              'subcategoria': subcategoria.text,
                              'preciopublico': preciopublico.text,
                              'precioreseller': precioreseller.text,
                              'puntaje': puntaje.text,
                              'vendidos': vendidos.text,
                              'urlpdf': urlpdf.text,
                              'urlimagen': imageUrl ?? widget.data.urlimagen,
                              'urlyoutube': urlyoutube.text,
                            };
                            await controller.actualizarproductoporid(data);
                          } else {
                            final data = {
                              'id': widget.data.id,
                              'nombre': nombre.text,
                              'description':
                                  listadedescripcion!.join('/').toString(),
                              'comentario': comentarios.text,
                              'categoria': categoria.text,
                              'subcategoria': subcategoria.text,
                              'preciopublico': preciopublico.text,
                              'precioreseller': precioreseller.text,
                              'puntaje': puntaje.text,
                              'vendidos': vendidos.text,
                              'urlpdf': urlpdf.text,
                              'urlimagen': widget.data.urlimagen,
                              'urlyoutube': urlyoutube.text,
                            };
                            debugPrint(data.toString());
                            await controller.actualizarproductoporid(data);
                          }

                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.edit,
                              size: 30,
                            ),
                            Text(
                              "Editar Producto",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () async {
                          controller.deleteproductbyid(widget.data.id);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.edit,
                              size: 30,
                            ),
                            Text(
                              "Eliminar Producto",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}

class InputformProducts extends StatelessWidget {
  const InputformProducts({
    super.key,
    required this.controller,
    required this.width,
    required this.titulo,
  });

  final TextEditingController controller;
  final double width;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: titulo,
        ),
      ),
    );
  }
}
