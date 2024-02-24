import 'package:rmc_bussiness/interface/model/products.dart';

class Section {
  dynamic id;
  dynamic section;
  dynamic titulo;
  dynamic subtitulo;
  dynamic contenido;
  dynamic reves;
  Products? producto;
  dynamic ancho;
  dynamic alto;
  dynamic useScroll;
  dynamic page;

  Section(
      {this.id,
      this.section,
      this.titulo,
      this.subtitulo,
      this.contenido,
      this.reves,
      this.producto,
      this.ancho,
      this.alto,
      this.useScroll,
      this.page});

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
        id: json['id'],
        section: json['section'],
        titulo: json['titulo'] ?? '',
        subtitulo: json['subtitulo'],
        contenido: json['contenido'],
        reves: json['reves'] ?? '',
        producto: json['producto'] != null
            ? Products.fromJson(json['producto'])
            : null,
        ancho: json['ancho'],
        alto: json['alto'],
        useScroll: json['usescroll'],
        page: json['pageview']);
  }
}
