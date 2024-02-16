import 'package:get/get.dart';
import 'package:rmc_bussiness/connection/function/getdata.dart';
import 'package:rmc_bussiness/interface/model/products.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerProducts extends GetxController {
  final conexiondatabase = GetDataProduct();
  RxList<Products> productcon = <Products>[].obs;

  Rx<Products?> productoseleccionado = Rx<Products?>(null);

  Future<void> getDataProductnow() async {
    final data = await conexiondatabase.getProducts();
    productcon
        .assignAll(data.map((e) => Products.fromJson(e.toJson())).toList());
  }

  Future<bool> saveidbyproduct(Products data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool res = await pref.setStringList("productsearch", [
      data.id,
      data.nombre,
      data.comentario,
      data.description,
      data.categoria,
      data.subcategoria,
      data.preciopublico,
      data.precioreseller,
      data.puntaje,
      data.vendidos,
      data.urlimagen
    ]);
    if (res) {
      productoseleccionado.value = data;
    }
    return res;
  }

  Future<Products?> getDataProductshared() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? productData = prefs.getStringList('productsearch');

    if (productData != null) {
      if (productData.length >= 10) {
        Products product = Products(
          id: productData[0],
          nombre: productData[1],
          comentario: productData[2],
          description: productData[3],
          categoria: productData[4],
          subcategoria: productData[5],
          preciopublico: productData[6],
          precioreseller: productData[7],
          puntaje: productData[8],
          vendidos: productData[9],
          urlimagen: productData[10],
        );

        productoseleccionado.value = product;

        return product;
      }
    }

    return null;
  }

  Future<List<Products>> getDataProductdestacable(String categoria) async {
    final data = await conexiondatabase.getProducts();

    if (categoria != "productos") {
      return data
          .where((product) =>
              int.parse(product.puntaje) > 2 && product.categoria == categoria)
          .toList();
    } else {
      return data.where((product) => int.parse(product.puntaje) > 7).toList();
    }
  }

  Future<List<Products>> getDataProductMasVendidos(String categoria) async {
    final data = await conexiondatabase.getProducts();
    switch (categoria) {
      case "Terminal":
        return data
            .where((product) =>
                int.parse(product.vendidos) > 20 &&
                product.categoria == "Terminal")
            .toList();
      case "Lector":
        return data
            .where((product) =>
                int.parse(product.vendidos) > 20 &&
                product.categoria == "Lector")
            .toList();
      case "Impresora":
        return data
            .where((product) =>
                int.parse(product.vendidos) > 20 &&
                product.categoria == "Impresora")
            .toList();
      default:
        return data
            .where((product) => int.parse(product.vendidos) > 50)
            .toList();
    }
  }

  Future<Products> getproductbyid(String idproduct) async {
    final data = await conexiondatabase.getProductByid(idproduct);
    return data;
  }

  // Future<List<Products>> getDataProductImpresorasdestacadas() async {
  //   final data = await conexiondatabase.getProducts();
  //   return data
  //       .where((product) =>
  //           int.parse(product.puntaje) > 7 && product.categoria == "Impresora")
  //       .toList();
  // }
}
