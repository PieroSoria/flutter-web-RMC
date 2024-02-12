import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/widget/card_productmuestra.dart';
import 'package:rmc_bussiness/controller/data/controller_products.dart';
import 'package:rmc_bussiness/interface/model/products.dart';

class SectionContainer extends StatefulWidget {
  final String titulo;
  final String subtitulo;
  final String contenido;
  final bool reves;
  final Color background;
  final String nombredelproducto;
  final double ancho;
  final double alto;
  final VoidCallback funcion;
  const SectionContainer({
    super.key,
    required this.titulo,
    required this.contenido,
    required this.reves,
    required this.subtitulo,
    required this.background,
    required this.nombredelproducto,
    required this.funcion,
    required this.ancho,
    required this.alto,
  });

  @override
  State<SectionContainer> createState() => _SectionContainerState();
}

class _SectionContainerState extends State<SectionContainer> {
  final controllerproduct = Get.put(ControllerProducts());
  Products products = Products(
    id: 'id',
    nombre: 'nombre',
    comentario: 'comentario',
    description: 'description',
    categoria: 'categoria',
    subcategoria: 'subcategoria',
    precio: 'precio',
    puntaje: 'puntaje',
    vendidos: 'vendidos',
    urlimagen: 'urlimagen',
  );

  @override
  void initState() {
    super.initState();
    inicializar();
  }

  Future<void> inicializar() async {
    final data =
        await controllerproduct.getproductbynombre(widget.nombredelproducto);
    setState(() {
      products = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      padding: const EdgeInsets.symmetric(vertical: 50),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.background,
      ),
      child: Center(
        child: SizedBox(
          width: widget.ancho,
          height: widget.alto,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  widget.titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "CenturyGothic",
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  widget.subtitulo,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontFamily: "CenturyGothic",
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              products.urlimagen != "urlimagen"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.reves
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: SizedBox(
                                  width: 600,
                                  child: Text(
                                    widget.contenido,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 17),
                                  ),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: SizedBox(
                                  width: 300,
                                  height: 350,
                                  child: CardProductMuestra(
                                    urlimagen: products.urlimagen,
                                    nombreproduct: widget.nombredelproducto,
                                    namebutton: "Leer Mas",
                                    funcion: widget.funcion,
                                    categoria: products.categoria,
                                  ),
                                ),
                              ),
                        widget.reves
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: SizedBox(
                                  width: 300,
                                  height: 350,
                                  child: CardProductMuestra(
                                    urlimagen: products.urlimagen,
                                    nombreproduct: widget.nombredelproducto,
                                    namebutton: "Leer Mas",
                                    funcion: widget.funcion,
                                    categoria: products.categoria,
                                  ),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: SizedBox(
                                  width: 600,
                                  child: Text(
                                    widget.contenido,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ),
                              )
                      ],
                    )
                  : const Center(
                      child: Text("Cargando datos "),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
