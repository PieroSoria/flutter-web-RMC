import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/layout/section/section_beneficios.dart';
import '../../components/layout/section/section_caract_product.dart';
import '../../components/layout/section/section_container.dart';
import '../../components/layout/section/section_destacados.dart';
import '../../components/layout/section/section_masvendidos.dart';
import '../../components/layout/section/section_product_diferencia.dart';
import '../../components/layout/section/section_promocion.dart';
import '../data/controller_products.dart';
import '../widget/selectwidget.dart';

class TipeSection extends StatefulWidget {
  final int index;
  const TipeSection({super.key, required this.index});

  @override
  State<TipeSection> createState() => _TipeSectionState();
}

class _TipeSectionState extends State<TipeSection> {
  final controllerwidget = Get.put(WidgetController());
  final controllerproduct = Get.put(ControllerProducts());

  @override
  void initState() {
    controllerproduct.onClose();
    controllerwidget.onInit();
    super.initState();
  }

  @override
  void dispose() {
    controllerproduct.onClose();
    controllerwidget.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 700,
      child: Obx(() {
        final sections = controllerwidget.futuresection;
        if (sections[widget.index].section == "Container") {
          return SectionContainer(
            titulo: sections[widget.index].titulo,
            contenido: sections[widget.index].contenido,
            reves: sections[widget.index].reves == "true" ? true : false,
            subtitulo: sections[widget.index].subtitulo,
            background: Colors.white,
            product: sections[widget.index].producto!,
            funcion: () async {
              final data = await controllerproduct
                  .getproductbyid(sections[widget.index].producto!.id);
              bool resul = await controllerproduct.saveidbyproduct(data);
              if (resul) {
                Get.toNamed(
                  '/Cardproduct',
                );
              }
            },
            ancho: double.parse(sections[widget.index].ancho),
            alto: double.parse(sections[widget.index].alto),
          );
        } else if (sections[widget.index].section == "Promocion") {
          return SectiondePromocion(
            titulo: sections[widget.index].titulo,
            contenido: sections[widget.index].contenido,
            background: Colors.white,
            categoria: sections[widget.index].producto!.categoria,
          );
        } else if (sections[widget.index].section == "Destacado") {
          return ProductosDestacados(
            titulo: sections[widget.index].titulo,
            categoria: sections[widget.index].producto!.categoria,
            scroll: sections[widget.index].useScroll == "true" ? true : false,
            sizewidth: double.parse(sections[widget.index].ancho),
            sizeheigth: double.parse(sections[widget.index].alto),
          );
        } else if (sections[widget.index].section == "Mas Vendidos") {
          return SectionMasVendidos(
            categoria: sections[widget.index].producto!.categoria,
            titulo: sections[widget.index].titulo,
          );
        } else if (sections[widget.index].section == "Beneficio") {
          return SectionBeneficios(
            titulo: sections[widget.index].titulo,
            datos: sections[widget.index].producto!.description.split(','),
            reves: sections[widget.index].reves == "true" ? true : false,
            background: Colors.white,
            products: sections[widget.index].producto!,
            funcion: () async {
              final data = await controllerproduct
                  .getproductbyid(sections[widget.index].producto!.id);
              bool resul = await controllerproduct.saveidbyproduct(data);
              if (resul) {
                Get.toNamed(
                  '/Cardproduct',
                );
              }
            },
          );
        } else if (sections[widget.index].section == "Diferencia") {
          return SectionDirefencia(
            titulo: sections[widget.index].titulo,
            contenido: sections[widget.index].contenido,
            product: sections[widget.index].producto!,
            background: Colors.white,
            funcion: () async {
              final data = await controllerproduct
                  .getproductbyid(sections[widget.index].producto!.id);
              bool resul = await controllerproduct.saveidbyproduct(data);
              if (resul) {
                Get.toNamed(
                  '/Cardproduct',
                );
              }
            },
          );
        } else if (sections[widget.index].section == "Caracteristicas") {
          return CaracteristicasdeProduct(
            titulo: sections[widget.index].titulo,
            contenido: sections[widget.index].contenido,
            product: sections[widget.index].producto!,
            background: Colors.white,
            funcion: () async {
              final data = await controllerproduct
                  .getproductbyid(sections[widget.index].producto!.id);
              bool resul = await controllerproduct.saveidbyproduct(data);
              if (resul) {
                Get.toNamed(
                  '/Cardproduct',
                );
              }
            },
          );
        } else {
          return const Center();
        }
      }),
    );
  }
}
