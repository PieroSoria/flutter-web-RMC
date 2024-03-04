import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmc_bussiness/connection/hosting/hosting_bussiens.dart';
import 'package:rmc_bussiness/connection/urls/urls_direction.dart';
import 'package:rmc_bussiness/interface/model/products.dart';

class ApiProductoAdmin {
  Future<bool> agregarnuevoproducto(Map<String, dynamic> data) async {
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

  Future<bool> actualizarproductoporid(Products data) async {
    final client = http.Client();

    try {
      var url = Uri.https(HostingRMC.hostingprueba, URLSDirection.urlprueba2);
      final datares = json.encode(data);
      var response = await client.post(url, body: datares);
      if (response.statusCode == 200) {
        debugPrint("Dato: ${response.body}");
        final Map<String, dynamic> responsejson = json.decode(response.body);
        if (responsejson['mensaje'] == 'Producto actualizado exitosamente') {
          debugPrint("Mensaje de éxito: ${responsejson['mensaje']}");
          return true;
        } else {
          debugPrint("Error: ${responsejson['mensaje']}");
          return false;
        }
      } else {
        debugPrint("Datos capturados: ${response.body}");
        return false;
      }
    } catch (e) {
      debugPrint("Error de servidor(actuializarproducto): $e");
      return false;
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

  Future<String?> subirimagenproducto({
    required Uint8List archivo,
    required String nombreimagen,
  }) async {
    final client = http.Client();
    try {
      var url = Uri.https(HostingRMC.hostingprueba, URLSDirection.enviarimagen);

      final request = http.MultipartRequest('POST', url)
        ..files.add(http.MultipartFile.fromBytes(
          'file',
          archivo,
          filename: nombreimagen,
        ));
      debugPrint("enviar: $request");
      var response = await client.send(request);
      if (response.statusCode == 200) {
        final String responseString = await utf8.decodeStream(response.stream);
        debugPrint("Dato capturado: $responseString");
        final Map<String, dynamic> jsonResponse = json.decode(responseString);
        final String imageUrl = jsonResponse['url'];
        return imageUrl;
      } else {
        final String errorString = await utf8.decodeStream(response.stream);
        debugPrint("Error: $errorString");

        return null;
      }
    } catch (e) {
      return null;
    } finally {
      client.close();
    }
  }
}
