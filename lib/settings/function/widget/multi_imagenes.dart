import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/settings/function/controller/admin_controller.dart';

class MultiImagenes extends StatefulWidget {
  final List<Widget>? items;
  final VoidCallback press;
  const MultiImagenes({super.key, this.items, required this.press});

  @override
  State<MultiImagenes> createState() => _MultiImagenesState();
}

class _MultiImagenesState extends State<MultiImagenes> {
  final controller = Get.put(SettingsAdmin());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              onPressed: widget.press, child: const Text("Buscar Imagenes")),
          SizedBox(
            width: 400,
            height: 200,
            child: Obx(
              () => CarouselSlider(
                items: widget.items,
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: null,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
