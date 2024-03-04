class Products {
  dynamic id;
  dynamic nombre;
  dynamic comentario;
  dynamic description;
  dynamic categoria;
  dynamic subcategoria;
  dynamic preciopublico;
  dynamic precioreseller;
  dynamic puntaje;
  dynamic vendidos;
  dynamic urlimagen;
  dynamic urlpdf;

  Products(
      {this.id,
      this.nombre,
      this.comentario,
      this.description,
      this.categoria,
      this.subcategoria,
      this.preciopublico,
      this.precioreseller,
      this.puntaje,
      this.vendidos,
      this.urlimagen,
      this.urlpdf});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'comentario': comentario,
      'description': description,
      'categoria': categoria,
      'subcategoria': subcategoria,
      'preciopublico': preciopublico,
      'precioreseller': precioreseller,
      'puntaje': puntaje,
      'vendidos': vendidos,
      'urlimagen': urlimagen,
      'urlpdf': urlpdf,
    };
  }

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      nombre: json['nombre'],
      comentario: json['comentario'],
      description: json['description'],
      categoria: json['categoria'],
      subcategoria: json['subcategoria'],
      preciopublico: json['preciopublico'],
      precioreseller: json['precioreseller'],
      puntaje: json['puntaje'],
      vendidos: json['vendidos'],
      urlimagen: json['urlimagen'],
      urlpdf: json['urlpdf'],
    );
  }
}
