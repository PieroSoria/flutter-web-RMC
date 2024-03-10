import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SectionBanners extends StatefulWidget {
  const SectionBanners({
    super.key,
    required this.width,
    required this.listaimagen,
  });

  final double width;
  final List<String> listaimagen;

  @override
  State<SectionBanners> createState() => _SectionBannersState();
}

class _SectionBannersState extends State<SectionBanners> {
  List<Widget> banners = [];

  @override
  void initState() {
    super.initState();
    banners = _buildBannerWidgets();
  }

  List<Widget> _buildBannerWidgets() {
    return widget.listaimagen.map((url) {
      return Image.network(
        url,
        fit: BoxFit.cover,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider(
        items: banners,
        options: CarouselOptions(
          height: widget.width > 600 ? 500 : 200,
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
    );
  }
}
