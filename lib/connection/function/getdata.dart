import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmc_bussiness/connection/hosting/hosting_bussiens.dart';
import 'package:rmc_bussiness/connection/urls/urls_direction.dart';
import 'package:rmc_bussiness/interface/model/products.dart';

class GetDataProduct {
  Future<List<Products>> getProducts() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.https(HostingRMC.hostingprueba, URLSDirection.urlprueba),
      );
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));

        if (decodedResponse is List) {
          List<Products> productsList = decodedResponse.map((productData) {
            return Products(
              id: productData['id'],
              nombre: productData['nombre'],
              comentario: productData['comentario'],
              description: productData['description'],
              categoria: productData['categoria'],
              subcategoria: productData['subcategoria'],
              preciopublico: productData['preciopublico'],
              precioreseller: productData['precioreseller'],
              puntaje: productData['puntaje'],
              vendidos: productData['vendidos'],
              urlimagen: productData['urlimagen'],
            );
          }).toList();

          return productsList;
        } else {
          debugPrint("Error: La respuesta no es una lista");
          return [];
        }
      } else {
        debugPrint("Error en la solicitud: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      debugPrint("Error durante la solicitud getproduct: $e");
      return [];
    } finally {
      client.close();
    }
  }

  Future<Products> getProductByid(String nombreproduct) async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.http(HostingRMC.hostingprueba, URLSDirection.urlprueba,
            {'id': nombreproduct}),
      );

      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        debugPrint(decodedResponse);
        if (decodedResponse is Map) {
          return Products(
            id: decodedResponse['id'],
            nombre: decodedResponse['nombre'],
            comentario: decodedResponse['comentario'],
            description: decodedResponse['description'],
            categoria: decodedResponse['categoria'],
            subcategoria: decodedResponse['subcategoria'],
            preciopublico: decodedResponse['preciopublico'],
            precioreseller: decodedResponse['precioreseller'],
            puntaje: decodedResponse['puntaje'],
            vendidos: decodedResponse['vendidos'],
            urlimagen: decodedResponse['urlimagen'],
          );
        } else {
          debugPrint("Error: La respuesta no es un mapa");
          return Products(
            id: 'id',
            nombre: 'nombre',
            comentario: 'comentario',
            description: 'description',
            categoria: 'categoria',
            subcategoria: 'subcategoria',
            preciopublico: 'preciopublico',
            precioreseller: 'precioreseller',
            puntaje: 'puntaje',
            vendidos: 'vendidos',
            urlimagen: 'urlimagen',
          );
        }
      } else {
        debugPrint("Error en la solicitud: ${response.statusCode}");
        return Products(
          id: 'id',
          nombre: 'nombre',
          comentario: 'comentario',
          description: 'description',
          categoria: 'categoria',
          subcategoria: 'subcategoria',
          preciopublico: 'preciopublico',
          precioreseller: 'precioreseller',
          puntaje: 'puntaje',
          vendidos: 'vendidos',
          urlimagen: 'urlimagen',
        );
      }
    } catch (e) {
      debugPrint("Error durante la solicitud: $e");
      return Products(
        id: 'id',
        nombre: 'nombre',
        comentario: 'comentario',
        description: 'description',
        categoria: 'categoria',
        subcategoria: 'subcategoria',
        preciopublico: 'preciopublico',
        precioreseller: 'precioreseller',
        puntaje: 'puntaje',
        vendidos: 'vendidos',
        urlimagen: 'urlimagen',
      );
    } finally {
      client.close();
    }
  }
}
