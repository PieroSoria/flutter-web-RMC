import 'package:flutter/material.dart';
import 'package:rmc_bussiness/components/widget/tarjectscroll.dart';

class SectionBanners extends StatelessWidget {
  const SectionBanners({
    super.key,
    required this.width, required this.listaimagen,
  });

  final double width;
  final List<String> listaimagen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width > 600 ? 500 : 200,
      child: TarjectScroll(
        crosaxiscount: 1,
        imagenrul: listaimagen,
        paddingcontainer: const EdgeInsets.symmetric(horizontal: 0),
        positop: 0,
        posileft: 0,
        posiright: 0,
        posibotom: 0,
        imagenheigth: width > 600 ? 500 : 200,
        usobuton: true,
      ),
    );
  }
}