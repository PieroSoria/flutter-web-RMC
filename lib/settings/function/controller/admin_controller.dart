import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../../connection/api/section/getsection.dart';
import '../../../interface/model/section.dart';

class SettingsAdmin extends GetxController {
  final getsection = GetSectionApi();
  RxBool ini = false.obs;
  RxString sectionmodeide = ''.obs;
  RxString pageview = 'Soluciones'.obs;
  RxList<Section> sectionactual = <Section>[].obs;
  RxInt index = 0.obs;

  Future<bool> loginadmin(String user, String password) async {
    var client = http.Client();
    try {
      var url = Uri.https(
          'pruebainverdaf.000webhostapp.com', 'function/userlogin.php');
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
      sectionactual.assignAll(
        data.map((e) => Section.fromJson(e.toJson())).toList(),
      );
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
}
