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
            nombredelproducto: sections[widget.index].nombreProducto,
            funcion: () async {
              final data = await controllerproduct
                  .getproductbynombre(sections[widget.index].nombreProducto);
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
            categoria: sections[widget.index].categoria,
          );
        } else if (sections[widget.index].section == "Destacado") {
          return ProductosDestacados(
            titulo: sections[widget.index].titulo,
            categoria: sections[widget.index].categoria,
            scroll: sections[widget.index].useScroll == "true" ? true : false,
            sizewidth: double.parse(sections[widget.index].ancho),
            sizeheigth: double.parse(sections[widget.index].alto),
          );
        } else if (sections[widget.index].section == "Mas Vendidos") {
          return SectionMasVendidos(
            categoria: sections[widget.index].categoria,
            titulo: sections[widget.index].titulo,
          );
        } else if (sections[widget.index].section == "Beneficio") {
          return SectionBeneficios(
            titulo: sections[widget.index].titulo,
            datos: sections[widget.index].beneficios.split(','),
            reves: sections[widget.index].reves == "true" ? true : false,
            background: Colors.white,
            nombreproduct: sections[widget.index].nombreProducto,
            funcion: () async {
              final data = await controllerproduct
                  .getproductbynombre(sections[widget.index].nombreProducto);
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
            nombreproduct: sections[widget.index].nombreProducto,
            background: Colors.white,
          );
        } else if (sections[widget.index].section == "Caracteristicas") {
          return CaracteristicasdeProduct(
            titulo: sections[widget.index].titulo,
            contenido: sections[widget.index].contenido,
            nombreproduct: sections[widget.index].nombreProducto,
            background: Colors.white,
          );
        } else {
          return const Center();
        }
      }),
    );
  }
}


// if (section[index].section == "Container") {
//                 return SectionContainer(
//                   titulo: section[index].titulo,
//                   contenido: section[index].contenido,
//                   reves: section[index].reves == "true" ? true : false,
//                   subtitulo: section[index].subtitulo,
//                   background: Colors.white,
//                   nombredelproducto: section[index].nombreProducto,
//                   funcion: () async {
//                     final data = await controllerproduct
//                         .getproductbynombre(section[index].nombreProducto);
//                     bool resul = await controllerproduct.saveidbyproduct(data!);
//                     if (resul) {
//                       Get.toNamed(
//                         '/Cardproduct',
//                       );
//                     }
//                   },
//                   ancho: double.parse(section[index].ancho),
//                   alto: double.parse(section[index].alto),
//                 );
//               } else if (section[index].section == "Promocion") {
//                 return SectiondePromocion(
//                   titulo: section[index].titulo,
//                   contenido: section[index].contenido,
//                   background: Colors.white,
//                   categoria: section[index].categoria,
//                 );
//               } else if (section[index].section == "Destacado") {
//                 return ProductosDestacados(
//                   titulo: section[index].titulo,
//                   categoria: section[index].categoria,
//                   scroll: section[index].useScroll == "true" ? true : false,
//                   sizewidth: double.parse(section[index].ancho),
//                   sizeheigth: double.parse(section[index].alto),
//                 );
//               } else if (section[index].section == "Mas Vendidos") {
//                 return SectionMasVendidos(
//                   categoria: section[index].categoria,
//                   titulo: section[index].titulo,
//                 );
//               } else if (section[index].section == "Beneficio") {
//                 return SectionBeneficios(
//                   titulo: section[index].titulo,
//                   datos: section[index].beneficios.split(','),
//                   reves: section[index].reves == "true" ? true : false,
//                   background: Colors.white,
//                   nombreproduct: section[index].nombreProducto,
//                   funcion: () async {
//                     final data = await controllerproduct
//                         .getproductbynombre(section[index].nombreProducto);
//                     bool resul = await controllerproduct.saveidbyproduct(data!);
//                     if (resul) {
//                       Get.toNamed(
//                         '/Cardproduct',
//                       );
//                     }
//                   },
//                 );
//               } else if (section[index].section == "Diferencia") {
//                 return SectionDirefencia(
//                   titulo: section[index].titulo,
//                   contenido: section[index].contenido,
//                   nombreproduct: section[index].nombreProducto,
//                   background: Colors.white,
//                 );
//               } else if (section[index].section == "Caracteristicas") {
//                 return CaracteristicasdeProduct(
//                   titulo: section[index].titulo,
//                   contenido: section[index].contenido,
//                   nombreproduct: section[index].nombreProducto,
//                   background: Colors.white,
//                 );
//               } else {
//                 return const Center();
//               }