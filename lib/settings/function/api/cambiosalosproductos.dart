import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmc_bussiness/connection/hosting/hosting_bussiens.dart';
import 'package:rmc_bussiness/connection/urls/urls_direction.dart';

class ApiProductoAdmin {
  Future<void> agregarnuevoproducto() async {
    final client = http.Client();
    try {
      var url = Uri.http(HostingRMC.hostingprueba, URLSDirection.urlprueba);
      var response = await client.post(url,body: {});
      if (response.statusCode == 200) {
        debugPrint("Datos capturados: ${response.body}");
      }
    } catch (e) {
      debugPrint("Error de servidor(agregarnuevoproducto): $e");
    } finally {
      client.close();
    }
  }

  Future<void> mostrarlosproductos() async {}

  Future<void> actualizarproductoporid(String id) async {}

  Future<void> eliminarproductoporid(String id) async {}
}
