import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/settings/function/controller/admin_controller.dart';

class MultiImagenes2 extends StatefulWidget {
  final List<String>? items;
  final bool string;
  final bool button;
  final List<Widget>? itemsnew;
  final VoidCallback press;
  const MultiImagenes2(
      {super.key,
      this.items,
      required this.press,
      required this.string,
      required this.itemsnew,
      this.button = true});

  @override
  State<MultiImagenes2> createState() => _MultiImagenes2State();
}

class _MultiImagenes2State extends State<MultiImagenes2> {
  final controller = Get.put(SettingsAdmin());

  List<Widget> itemswidget = [];

  List<Widget> _changed() {
    return widget.items?.map((e) => Image.network(e)).toList() ?? [];
  }

  @override
  void initState() {
    itemswidget = _changed();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          widget.button
              ? ElevatedButton(
                  onPressed: widget.press, child: const Text("Buscar Imagenes"))
              : const SizedBox.shrink(),
          SizedBox(
            width: 400,
            height: 200,
            child: CarouselSlider(
              items: widget.string ? itemswidget : widget.itemsnew,
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
          )
        ],
      ),
    );
  }
}
