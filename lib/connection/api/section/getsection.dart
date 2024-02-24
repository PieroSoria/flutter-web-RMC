import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rmc_bussiness/connection/hosting/hosting_bussiens.dart';
import 'package:rmc_bussiness/connection/urls/urls_direction.dart';
import 'package:rmc_bussiness/interface/model/section.dart';
import 'package:http/http.dart' as http;

class GetSectionApi {
  Future<List<Section>> getsectionbd(String pageview) async {
    final client = http.Client();
    try {
      var url = Uri.http(
        HostingRMC.hostingprueba,
        URLSDirection.urlpruebasection,
        {'pageview': pageview},
      );

      var response = await client.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        final sections =
            jsonResponse.map((data) => Section.fromJson(data)).toList();

        return sections;
      } else {
        debugPrint(
            'Error al obtener las secciones. Código de estado: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint("Error del servidor getsection : $e");
      return [];
    } finally {
      client.close();
    }
  }

  Future<bool> createSectiondb(Map<String, dynamic> section) async {
    final client = http.Client();
    try {
      var url =
          Uri.http(HostingRMC.hostingprueba, URLSDirection.urlpruebasection);

      final jsonda = json.encode(section);
      debugPrint(jsonda.toString());
      var response = await client.post(
        url,
        body: jsonda,
      );
      if (response.statusCode == 200) {
        var parsedSections = json.decode(response.body);
        debugPrint('Secciones creadas exitosamente: $parsedSections');
        return true;
      } else {
        var errorMessage = jsonDecode(response.body)['mensaje'];
        debugPrint('Error al crear las secciones: $errorMessage');
        return false;
      }
    } catch (e) {
      debugPrint("Error del servidor : $e");
      return false;
    } finally {
      client.close();
    }
  }

  Future<bool> removeItemSectionDatabase(String id) async {
    final client = http.Client();
    try {
      var url = Uri.https(HostingRMC.hostingprueba,
          URLSDirection.urlpruebasection2, {'id': id});
      debugPrint(url.toString());

      var response = await client.get(url);

      if (response.statusCode == 200) {
        var jsonDecoderMap = json.decode(response.body);
        debugPrint("Mensaje de los datos a eliminar : $jsonDecoderMap");
        return true;
      } else {
        debugPrint(
            "Error del servidor - Código de estado: ${response.statusCode}");
        debugPrint("Respuesta del servidor: ${response.body}");
        return false;
      }
    } catch (e) {
      debugPrint("Error : $e");
      return false;
    } finally {
      client.close();
    }
  }

  Future<bool> actualizaritemsection(Section section) async {
    final client = http.Client();

    try {
      var url =
          Uri.https(HostingRMC.hostingprueba, URLSDirection.urlpruebasection2);
      final jsonda = json.encode(section);
      var response = await client.post(url, body: jsonda);
      if (response.statusCode == 200) {
        var parsedSections = json.decode(response.body);
        debugPrint("Mensaje del servidor: $parsedSections");
        return true;
      } else {
        debugPrint("Error del servidor : ${response.statusCode}");
        return false;
      }
    } catch (e) {
      debugPrint("Error de Actualizar Section : $e");
      return false;
    } finally {
      client.close();
    }
  }
}
