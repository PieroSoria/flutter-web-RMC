class Products {
  String id;
  String nombre;
  String comentario;
  String description;
  String categoria;
  String subcategoria;
  String precio;
  String puntaje;
  String vendidos;
  String urlimagen;

  Products(
      {required this.id,
      required this.nombre,
      required this.comentario,
      required this.description,
      required this.categoria,
      required this.subcategoria,
      required this.precio,
      required this.puntaje,
      required this.vendidos,
      required this.urlimagen});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'comentario': comentario,
      'description': description,
      'categoria': categoria,
      'subcategoria': subcategoria,
      'precio': precio,
      'puntaje': puntaje,
      'vendidos': vendidos,
      'urlimagen': urlimagen,
    };
  }

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] ?? '',
      nombre: json['nombre'] ?? '',
      comentario: json['comentario'] ?? '',
      description: json['description'] ?? '',
      categoria: json['categoria'] ?? '',
      subcategoria: json['subcategoria'] ?? '',
      precio: json['precio'] ?? '',
      puntaje: json['puntaje'] ?? '',
      vendidos: json['vendidos'] ?? '',
      urlimagen: json['urlimagen'] ?? '',
    );
  }
}
