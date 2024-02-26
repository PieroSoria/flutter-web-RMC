import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmc_bussiness/connection/hosting/hosting_bussiens.dart';
import 'package:rmc_bussiness/connection/urls/urls_direction.dart';
import 'package:rmc_bussiness/interface/model/products.dart';

class ApiProductoAdmin {
  Future<bool> agregarnuevoproducto(Map<String,dynamic> data) async {
    final client = http.Client();
    try {
      var url = Uri.https(HostingRMC.hostingprueba, URLSDirection.urlprueba);
      final result = json.encode(data);
      debugPrint(result);
      var response = await client.post(url, body: result);
      if (response.statusCode == 200) {
        debugPrint("Datos capturados: ${response.body}");
        return true;
      } else {
        debugPrint("Error del servidor: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      debugPrint("Error de servidor(agregarnuevoproducto): $e");
      return false;
    } finally {
      client.close();
    }
  }

  Future<List<Products>> mostrarlosproductos() async {
    final client = http.Client();
    try {
      var url = Uri.https(HostingRMC.hostingprueba, URLSDirection.urlprueba);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        debugPrint("Datos capturados: ${response.body}");
        List<dynamic> jsondata = json.decode(response.body);
        List<Products> resultdata =
            jsondata.map((e) => Products.fromJson(e)).toList();
        return resultdata;
      } else {
        debugPrint(
            "Error del servidor(mostrarproductos): ${response.statusCode}");
        return [];
      }
    } catch (e) {
      debugPrint("Error de servidor(mostrarproductos): $e");
      return [];
    } finally {
      client.close();
    }
  }

  Future<void> actualizarproductoporid(Products data) async {
    final client = http.Client();
    try {
      var url = Uri.https(HostingRMC.hostingprueba, URLSDirection.urlprueba2);
      final result = json.encode(data);
      var response = await client.post(url, body: result);
      if (response.statusCode == 200) {
        debugPrint("Datos capturados: ${response.body}");
      } else {}
    } catch (e) {
      debugPrint("Error de servidor(actuializarproducto): $e");
    } finally {
      client.close();
    }
  }

  Future<bool> eliminarproductoporid(String id) async {
    final client = http.Client();
    try {
      var url = Uri.https(
          HostingRMC.hostingprueba, URLSDirection.urlprueba2, {'id': id});

      var response = await client.get(url);
      if (response.statusCode == 200) {
        debugPrint("Datos capturados: ${response.body}");
        return true;
      } else {
        debugPrint("Error del sistema: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      debugPrint("Error de servidor(eliminar producto): $e");
      return false;
    } finally {
      client.close();
    }
  }
}
