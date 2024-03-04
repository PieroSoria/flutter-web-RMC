import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:rmc_bussiness/interface/model/products.dart';
import 'package:rmc_bussiness/settings/function/controller/admin_controller.dart';

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

  @override
  void initState() {
    nombre.text = widget.data.nombre;
    categoria.text = widget.data.categoria;
    description.text = widget.data.description;
    subcategoria.text = widget.data.subcategoria;
    comentarios.text = widget.data.comentario;
    urlpdf.text = widget.data.urlpdf;
    preciopublico.text = widget.data.preciopublico;
    precioreseller.text = widget.data.precioreseller;
    puntaje.text = widget.data.puntaje;
    vendidos.text = widget.data.vendidos;
    imagenurldata = widget.data.urlimagen;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
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
      child: Stack(
        children: [
          Align(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(),
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
                      InputformProducts(
                        controller: description,
                        width: 400,
                        titulo: 'descripcion del producto',
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
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.capturarimagen();
                    },
                    child: Obx(
                      () => Container(
                        width: 300,
                        height: 300,
                        decoration: const BoxDecoration(),
                        child: imagenurldata != null
                            ? ImageNetwork(
                                image: imagenurldata!, height: 300, width: 300)
                            : Image.asset('image/agregeproduct.jpg',
                                height: 300, width: 300),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: SizedBox(
                width: 100,
                height: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.actualizarproductoporid(Products(
                            id: widget.data.id,
                            nombre: nombre.text,
                            comentario: comentarios.text,
                            description: description.text,
                            categoria: categoria.text,
                            subcategoria: subcategoria.text,
                            preciopublico: preciopublico.text,
                            precioreseller: precioreseller.text,
                            puntaje: puntaje.text,
                            vendidos: vendidos.text,
                            urlimagen: widget.data.urlimagen,
                            urlpdf: urlpdf.text));
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.deleteproductbyid(widget.data.id);
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
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
