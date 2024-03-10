import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/layout/section/section_banner.dart';

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
    controllerproduct.onInit();
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
      child: Obx(() {
        final sections = controllerwidget.futuresection[widget.index];

        if (sections.section == "Container") {
          return SectionContainer(
            titulo: sections.titulo,
            contenido: sections.contenido,
            reves: sections.reves == "true" ? true : false,
            subtitulo: sections.subtitulo,
            background: Colors.white,
            product: sections.producto!,
            funcion: () async {
              final data = await controllerproduct
                  .getproductbyid(sections.producto!.id.toString());
              bool resul = await controllerproduct.saveidbyproduct(data);
              if (resul) {
                Get.toNamed(
                  '/Cardproduct',
                );
              }
            },
          );
        } else if (sections.section == "Promocion") {
          return SectiondePromocion(
            titulo: sections.titulo,
            contenido: sections.contenido,
            background: Colors.white,
            categoria: sections.producto!.categoria,
          );
        } else if (sections.section == "Destacado") {
          return ProductosDestacados(
            titulo: sections.titulo,
            categoria: sections.producto!.categoria,
            scroll: sections.useScroll == "true" ? true : false,
            sizewidth: 1200,
            sizeheigth: 700,
          );
        } else if (sections.section == "Mas Vendidos") {
          return SectionMasVendidos(
            categoria: sections.producto!.categoria,
            titulo: sections.titulo,
          );
        } else if (sections.section == "Beneficio") {
          return SectionBeneficios(
            titulo: sections.titulo,
            datos: sections.producto!.description..toString().split('/'),
            reves: sections.reves == "true" ? true : false,
            background: Colors.white,
            products: sections.producto!,
            funcion: () async {
              final data =
                  await controllerproduct.getproductbyid(sections.producto!.id);
              bool resul = await controllerproduct.saveidbyproduct(data);
              if (resul) {
                Get.toNamed(
                  '/Cardproduct',
                );
              }
            },
          );
        } else if (sections.section == "Diferencia") {
          return SectionDirefencia(
            titulo: sections.titulo,
            contenido: sections.contenido,
            product: sections.producto!,
            background: Colors.white,
            funcion: () async {
              final data =
                  await controllerproduct.getproductbyid(sections.producto!.id);
              bool resul = await controllerproduct.saveidbyproduct(data);
              if (resul) {
                Get.toNamed(
                  '/Cardproduct',
                );
              }
            },
          );
        } else if (sections.section == "Caracteristicas") {
          return CaracteristicasdeProduct(
            titulo: sections.titulo,
            contenido: sections.contenido,
            product: sections.producto!,
            background: Colors.white,
            funcion: () async {
              final data =
                  await controllerproduct.getproductbyid(sections.producto!.id);
              bool resul = await controllerproduct.saveidbyproduct(data);
              if (resul) {
                Get.toNamed(
                  '/Cardproduct',
                );
              }
            },
          );
        } else if (sections.section == "ImagenSection") {
          return const SectionBanners(
            listaimagen: [],
          );
        } else {
          return const Center();
        }
      }),
    );
  }
}
