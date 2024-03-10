import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rmc_bussiness/connection/hosting/hosting_bussiens.dart';
import 'package:rmc_bussiness/connection/urls/urls_direction.dart';
import 'package:rmc_bussiness/interface/model/products.dart';
import 'package:rmc_bussiness/settings/function/api/cambiosalosproductos.dart';
import 'package:rmc_bussiness/settings/function/model/multi_imagenes_model.dart';

import '../../../connection/api/section/getsection.dart';
import '../../../interface/model/section.dart';

class SettingsAdmin extends GetxController {
  final getsection = GetSectionApi();
  final getproductos = ApiProductoAdmin();
  RxBool ini = false.obs;
  RxString sectionmodeide = ''.obs;
  RxString pageview = 'Home'.obs;
  RxList<Section> sectionactual = <Section>[].obs;
  RxList<Products> listaproductos = <Products>[].obs;
  RxInt index = 0.obs;
  Rx<Uint8List?> imagecapturada = Rx<Uint8List?>(null);
  RxList<MultiImagen> listadeimagenes = <MultiImagen>[].obs;
  RxList<Widget> items = <Widget>[].obs;
  Rx<Uint8List?> imagecapturada2 = Rx<Uint8List?>(null);
  RxList<MultiImagen> listadeimagenes2 = <MultiImagen>[].obs;
  RxList<Widget> items2 = <Widget>[].obs;

  void changeitems() {
    items.assignAll(listadeimagenes
        .map((element) => Image.memory(element.imagen))
        .toList());
  }

  void changeitems2() {
    items2.assignAll(listadeimagenes2
        .map((element) => Image.memory(element.imagen))
        .toList());
  }

  RxString nombredelaimagen = ''.obs;
  RxString nombredelaimagen2 = ''.obs;

  Future<bool> loginadmin(String user, String password) async {
    var client = http.Client();
    try {
      var url = Uri.https(HostingRMC.hostingprueba, URLSDirection.urluserlogin);
      var response =
          await client.post(url, body: {'email': user, 'pass': password});
      if (response.statusCode == 200) {
        final jsonResponse = await json.decode(response.body);
        debugPrint(jsonResponse.toString());
        if (jsonResponse.isNotEmpty &&
            jsonResponse[0]['mensaje'] != 'Sin Resultados') {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      client.close();
    }
  }

  Future<void> refreshlistsection(String pageview) async {
    sectionactual.clear();
    final data = await getsection.getsectionbd(pageview);
    if (data.isNotEmpty) {
      sectionactual.assignAll(data);
    } else {
      debugPrint("Los datos son nulos");
    }
  }

  Future<void> removeitemsection(String id) async {
    bool result = await getsection.removeItemSectionDatabase(id);
    if (result) {
      sectionactual.removeWhere((element) => element.id == id);
      sectionactual.refresh();
      Get.snackbar("Exito", "Se elimino el registro");
    } else {
      Get.snackbar("Opps!", "Ocurrio un error");
    }
  }

  Future<bool> actualizarsection(Map<String, dynamic> section) async {
    bool result = await getsection.actualizaritemsection(section);
    if (result) {
      int index = sectionactual.indexWhere((s) => s.id == section['id']);
      if (index != -1) {
        sectionactual[index] = Section.fromJson(section);
        sectionactual.refresh();
      }
      return true;
    }
    return false;
  }

  Future<void> getdataproducts() async {
    listaproductos.clear();
    final data = await getproductos.mostrarlosproductos();
    listaproductos.assignAll(data);
  }

  Future<void> deleteproductbyid(String id) async {
    final resul = await getproductos.eliminarproductoporid(id);
    if (resul) {
      Get.snackbar("Exito", "Se elimino el producto");
    } else {
      Get.snackbar("Opps!", "Error de la peticion");
    }
  }

  Future<void> agregarnuevoproducto(Map<String, dynamic> products) async {
    final result = await getproductos.agregarnuevoproducto(products);
    if (result) {
      imagecapturada(null);
      nombredelaimagen("");
      await getdataproducts();
      Get.snackbar("Exito", "Se guardo el producto");
    } else {
      Get.snackbar("Opps!", "Error de la peticion");
    }
  }

  Future<void> actualizarproductoporid(Map<String, dynamic> data) async {
    final result = await getproductos.actualizarproductoporid(data);
    if (result) {
      imagecapturada2(null);
      listadeimagenes2.clear();
      items2.clear();
      nombredelaimagen2("");
      await getdataproducts();
      Get.snackbar("Exito", "Producto Actualizado correctamente");
    } else {
      Get.snackbar("Opps!", "Hubo un problema");
    }
  }

  Future<void> capturarimagen() async {
    final imagepicker = ImagePicker();
    final List<XFile> results = await imagepicker.pickMultiImage();

    if (results.isNotEmpty) {
      for (final result in results) {
        final archivo = await result.readAsBytes();
        listadeimagenes
            .add(MultiImagen(nombre: result.name.toString(), imagen: archivo));
        imagecapturada(archivo);

        nombredelaimagen(result.name);
      }
    } else {
      debugPrint('Selección de imágenes cancelada.');
    }
  }

  Future<void> capturarimagen2() async {
    final imagepicker = ImagePicker();
    final List<XFile> results = await imagepicker.pickMultiImage();

    if (results.isNotEmpty) {
      for (final result in results) {
        debugPrint("data: ${result.name}");
        final archivo = await result.readAsBytes();
        listadeimagenes2
            .add(MultiImagen(nombre: result.name.toString(), imagen: archivo));
        imagecapturada2(archivo);
        nombredelaimagen2(result.name);
      }
    } else {
      debugPrint('Selección de imágenes cancelada.');
    }
  }
}
