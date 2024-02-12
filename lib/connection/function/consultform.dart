import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmc_bussiness/connection/hosting/hosting_bussiens.dart';
import 'package:rmc_bussiness/connection/urls/urls_direction.dart';

class ConsulFormHttp {
  Future<bool> sendemailform(
      String nombre,
      String apellido,
      String email,
      String telefono,
      String empresa,
      String webempresa,
      String consulta,
      String mensaje) async {
    final client = http.Client();
    try {
      var url =
          Uri.https(HostingRMC.hostingprueba, URLSDirection.urlpruebasend);
      var response = await client.post(url, body: {
        'nombre': nombre,
        'apellido': apellido,
        'email': email,
        'telefono': telefono,
        'empresa': empresa,
        'webempresa': webempresa,
        'consulta': consulta,
        'mensaje': mensaje
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        debugPrint('Respuesta del servidor: $data');
        return data["mensaje"] == "Correo enviado correctamente";
      } else {
        debugPrint(
            'Error en la solicitud. Código de estado: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      debugPrint("Error durante la solicitud: $e");
      return false;
    } finally {
      client.close();
    }
  }
}
