import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/interface/model/products.dart';
import 'package:rmc_bussiness/settings/function/controller/admin_controller.dart';
import 'package:rmc_bussiness/settings/function/page/productos/datoproducts.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 224, 224, 224)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Agregar un Nuevo Producto"),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () async {
                  final data = {
                    'nombre': nombre.text,
                    'description': description.text,
                    'comentario': comentarios.text,
                    'categoria': categoria.text,
                    'subcategoria': subcategoria.text,
                    'preciopublico': preciopublico.text,
                    'precioreseller': precioreseller.text,
                    'puntaje': puntaje.text,
                    'vendidos': vendidos.text,
                    'urlpdf': urlpdf.text,
                    'urlimagen': 'assets/image/agregeproduct.jpg'
                  };
                  await controller.agregarnuevoproducto(data);
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
            )
          ],
        ),
      ),
    );
  }
}
