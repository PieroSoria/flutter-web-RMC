import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/connection/api/section/getsection.dart';
import 'package:rmc_bussiness/interface/model/section.dart';

class WidgetController extends GetxController {
  RxInt indexwidget = 0.obs;
  RxList<Section> futuresection = <Section>[].obs;

  final apisection = GetSectionApi();

  Future<List<Section>> obtenersection(String pageview) async {
    final List<Section> data = await apisection.getsectionbd(pageview);
    futuresection.clear();
    if (data.isNotEmpty) {
      futuresection.assignAll(data);
    } else {
      debugPrint("Los datos son nulos");
    }

    return data;
  }
}
