import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/widget/imagendesection.dart';
import 'package:rmc_bussiness/controller/data/controller_imagen_data.dart';

class ContentTarjectScroll extends StatefulWidget {
  final int index;
  final double imagenheight;
  final List<String> imagenurl;
  const ContentTarjectScroll(
      {super.key,
      required this.index,

      required this.imagenheight,
      required this.imagenurl});

  @override
  State<ContentTarjectScroll> createState() => _ContentTarjectScrollState();
}

class _ContentTarjectScrollState extends State<ContentTarjectScroll> {
  final controllerimagen = Get.put(ControllerImagen());

  @override
  void initState() {
    controllerimagen.agregarimagensection(widget.imagenurl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.imagenheight,
      decoration: const BoxDecoration(),
      child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Obx(
                    () => ImagenSection(
                      imagenurl:
                          controllerimagen.imagenlistsection[widget.index],
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ],
            )
          
    );
  }
}
