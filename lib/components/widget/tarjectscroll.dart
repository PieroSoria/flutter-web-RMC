import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_list_view/horizontal_list_view.dart';
import 'package:rmc_bussiness/components/widget/circuletab.dart';
import 'package:rmc_bussiness/components/widget/content_tarject_section.dart';
import 'package:rmc_bussiness/controller/data/controller_imagen_data.dart';

class TarjectScroll extends StatefulWidget {
  final int crosaxiscount;
  final List<String> imagenrul;
  final EdgeInsetsGeometry paddingcontainer;
  final double positop;
  final double posileft;
  final double posiright;
  final double posibotom;
  final bool titleimagen;
  final double imagenheigth;
  final bool usobuton;
  const TarjectScroll({
    super.key,
    required this.crosaxiscount,
    required this.imagenrul,
    required this.paddingcontainer,
    required this.positop,
    required this.posileft,
    required this.posiright,
    required this.posibotom,
    required this.titleimagen,
    required this.imagenheigth,
    required this.usobuton,
  });

  @override
  State<TarjectScroll> createState() => _TarjectScrollState();
}

class _TarjectScrollState extends State<TarjectScroll> {
  final HorizontalListViewController _controller =
      HorizontalListViewController();
  final controllerimage = Get.put(ControllerImagen());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: widget.positop,
          right: widget.posiright,
          left: widget.posileft,
          bottom: widget.posibotom,
          child: Padding(
            padding: widget.paddingcontainer,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (details.primaryDelta! > 5) {
                  _controller.animateToPage(
                    _controller.currentPage == 0
                        ? _controller.pageLenght
                        : _controller.currentPage - 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linearToEaseOut,
                  );
                } else if (details.primaryDelta! < -5) {
                  _controller.animateToPage(
                    _controller.currentPage == _controller.pageLenght
                        ? 0
                        : _controller.currentPage + 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linearToEaseOut,
                  );
                }
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(),
                child: HorizontalListView.builder(
                  crossAxisCount: widget.crosaxiscount,
                  crossAxisSpacing: 30,
                  alignment: CrossAxisAlignment.center,
                  controller: _controller,
                  itemCount: widget.imagenrul.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ContentTarjectScroll(
                      index: index,
                      data: widget.titleimagen,
                      imagenheight: widget.imagenheigth,
                      imagenurl: widget.imagenrul,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: widget.usobuton
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widget.titleimagen ? 40 : 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CirculoTap(
                        function: () {
                          _controller.animateToPage(
                            _controller.currentPage == 0
                                ? _controller.pageLenght
                                : _controller.currentPage - 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linearToEaseOut,
                          );
                        },
                        icon: Icons.arrow_back_ios_new_sharp,
                        ini: const Color.fromARGB(255, 0, 112, 192),
                        fin: const Color.fromARGB(255, 255, 163, 52),
                        sizeicon: 30,
                        backgroundsize: 15,
                      ),
                      CirculoTap(
                        function: () {
                          _controller.animateToPage(
                            _controller.currentPage == _controller.pageLenght
                                ? 0
                                : _controller.currentPage + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linearToEaseOut,
                          );
                        },
                        icon: Icons.arrow_forward_ios_outlined,
                        ini: const Color.fromARGB(255, 0, 112, 192),
                        fin: const Color.fromARGB(255, 255, 163, 52),
                        sizeicon: 30,
                        backgroundsize: 15,
                      ),
                    ],
                  ),
                )
              : null,
        )
      ],
    );
  }
}
