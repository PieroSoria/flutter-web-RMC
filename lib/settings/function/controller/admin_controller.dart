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

import '../../../connection/api/section/getsection.dart';
import '../../../interface/model/section.dart';

class SettingsAdmin extends GetxController {
  final getsection = GetSectionApi();
  final getproductos = ApiProductoAdmin();
  RxBool ini = false.obs;
  RxString sectionmodeide = ''.obs;
  RxString pageview = 'Soluciones'.obs;
  RxList<Section> sectionactual = <Section>[].obs;
  RxList<Products> listaproductos = <Products>[].obs;
  RxInt index = 0.obs;
  Rx<Uint8List?> imagecapturada = Rx<Uint8List?>(null);
  Rx<Uint8List?> imagecapturada2 = Rx<Uint8List?>(null);

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

  Future<void> actualizarsection(Section section) async {
    bool result = await getsection.actualizaritemsection(section);
    if (result) {
      int index = sectionactual.indexWhere((s) => s.id == section.id);
      if (index != -1) {
        sectionactual[index] = section;
        sectionactual.refresh();
      }
    }
  }

  Future<void> getdataproducts() async {
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
      Get.snackbar("Exito", "Se guardo el producto");
    } else {
      Get.snackbar("Opps!", "Error de la peticion");
    }
  }

  Future<void> actualizarproductoporid(Map<String, dynamic> data) async {
    final result = await getproductos.actualizarproductoporid(data);
    if (result) {
      imagecapturada2(null);
      nombredelaimagen2("");
      Get.snackbar("Exito", "Producto Actualizado correctamente");
    } else {
      Get.snackbar("Opps!", "Hubo un problema");
    }
  }

  Future<void> capturarimagen() async {
    final imagepicker = ImagePicker();
    final XFile? result =
        await imagepicker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      debugPrint("data: ${result.name}");
      final archivo = await result.readAsBytes();
      imagecapturada(archivo);
      nombredelaimagen(result.name);
    } else {
      debugPrint('Selección de imagen cancelada.');
    }
  }

  Future<void> capturarimagen2() async {
    final imagepicker = ImagePicker();
    final XFile? result =
        await imagepicker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      debugPrint("data: ${result.name}");
      final archivo = await result.readAsBytes();
      imagecapturada2(archivo);
      nombredelaimagen2(result.name);
    } else {
      debugPrint('Selección de imagen cancelada.');
    }
  }
}
