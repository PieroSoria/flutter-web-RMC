import 'package:get/get.dart';

class ControllerImagen extends GetxController {
  RxList<String> imagenlistsection = <String>[].obs;
  RxList<String> imagenlistproduct = <String>[].obs;

  Future<void> agregarimagensection(List<String> data) async {
    imagenlistsection.clear();
    imagenlistsection.addAll(data);
  }

  Future<void> agregarimagenproduct(List<String> data) async {
    imagenlistproduct.clear();
    imagenlistproduct.addAll(data);
  }
}
