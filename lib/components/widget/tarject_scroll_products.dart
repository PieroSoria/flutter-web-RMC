import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_list_view/horizontal_list_view.dart';
import 'package:rmc_bussiness/components/widget/card_productmuestra.dart';
import 'package:rmc_bussiness/interface/model/products.dart';

import '../../controller/data/controller_products.dart';
import 'circuletab.dart';

class TarjectScrollProducts extends StatefulWidget {
  final double positop;
  final double posileft;
  final double posiright;
  final double posibotom;
  final int countitem;
  final bool usobuton;
  final String tipo;
  final List<Products> data;
  final EdgeInsetsGeometry paddingcontainer;
  const TarjectScrollProducts(
      {super.key,
      required this.positop,
      required this.posileft,
      required this.posiright,
      required this.posibotom,
      required this.paddingcontainer,
      required this.countitem,
      required this.usobuton,
      required this.tipo,
      required this.data});

  @override
  State<TarjectScrollProducts> createState() => _TarjectScrollProductsState();
}

class _TarjectScrollProductsState extends State<TarjectScrollProducts> {
  final HorizontalListViewController _controller =
      HorizontalListViewController();
  final controllerproduct = Get.put(ControllerProducts());
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
                    _controller.currentPage == _controller.pageLenght - 1
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
                  crossAxisCount: widget.countitem,
                  crossAxisSpacing: 30,
                  alignment: CrossAxisAlignment.center,
                  controller: _controller,
                  itemCount: widget.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardProductMuestra(
                      urlimagen: widget.data[index].urlimagen,
                      nombreproduct: widget.data[index].nombre,
                      namebutton: 'leer mas',
                      funcion: () async {
                        bool resul = await controllerproduct
                            .saveidbyproduct(widget.data[index]);
                        if (resul) {
                          Get.toNamed('/Cardproduct');
                        }
                      },
                      categoria: widget.data[index].categoria,
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                            _controller.currentPage ==
                                    _controller.pageLenght - 1
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
