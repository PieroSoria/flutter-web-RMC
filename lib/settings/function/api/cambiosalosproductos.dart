import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmc_bussiness/connection/hosting/hosting_bussiens.dart';
import 'package:rmc_bussiness/connection/urls/urls_direction.dart';
import 'package:rmc_bussiness/interface/model/products.dart';
import 'package:rmc_bussiness/settings/function/model/multi_imagenes_model.dart';

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

  Future<bool> actualizarproductoporid(Map<String, dynamic> data) async {
    final client = http.Client();
    try {
      var url = Uri.https(HostingRMC.hostingprueba, URLSDirection.urlprueba2);
      final result = json.encode(data);
      var response = await client.post(url, body: result);
      if (response.statusCode == 200) {
        debugPrint("Datos capturados: ${response.body}");
        return true;
      } else {
        debugPrint("Error del servidor: ${response.statusCode}");
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

  Future<List<String>?> subirMultiplesImagenesProductos(
      {required List<MultiImagen> multiImagenes}) async {
    final client = http.Client();
    List<String> urls = [];
    try {
      var url = Uri.https(HostingRMC.hostingprueba, URLSDirection.enviarimagen);

      final List<http.MultipartFile> files = multiImagenes.map((imagen) {
        return http.MultipartFile.fromBytes(
          'files[]',
          imagen.imagen,
          filename: imagen.nombre,
        );
      }).toList();

      final request = http.MultipartRequest('POST', url)..files.addAll(files);

      var response = await client.send(request);

      if (response.statusCode == 200) {
        final String responseString = await utf8.decodeStream(response.stream);
        debugPrint("Dato capturado: $responseString");

        final List<String> jsonResponse =
            json.decode(responseString).cast<String>();

        for (var item in jsonResponse) {
          urls.add(item);
        }
      } else {
        final String errorString = await utf8.decodeStream(response.stream);
        debugPrint("Error: $errorString");
        // Manejar el error según tus necesidades
        return null;
      }

      return urls;
    } catch (e) {
      debugPrint("Error al enviar: $e");
      return null;
    } finally {
      client.close();
    }
  }
}
