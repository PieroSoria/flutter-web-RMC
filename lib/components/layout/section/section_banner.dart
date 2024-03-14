import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class SectionBanners extends StatefulWidget {
  const SectionBanners({
    super.key,
    required this.listaimagen,
  });
  final List<String> listaimagen;

  @override
  State<SectionBanners> createState() => _SectionBannersState();
}

class _SectionBannersState extends State<SectionBanners> {
  int selectedIndex = 0;
  final controller = InfiniteScrollController(initialItem: 0);
  List<Widget> banners = [];

  @override
  void initState() {
    super.initState();
    banners = _buildBannerWidgets();
  }

  List<Widget> _buildBannerWidgets() {
    return widget.listaimagen.map((url) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.fill,
        )),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: CarouselSlider(
        items: banners,
        options: CarouselOptions(
          height: width > 600 ? 600 : 200,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
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
          clipBehavior: Clip.none,
        ),
      ),
    );
  }
}
