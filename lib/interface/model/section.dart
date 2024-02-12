class Section {
  String id;
  String section;
  String titulo;
  String subtitulo;
  String contenido;
  String reves;
  String nombreProducto;
  String categoria;
  String subcategoria;
  String beneficios;
  String caracteristicas;
  String ancho;
  String alto;
  String useScroll;
  String page;

  Section(
      {required this.id,
      required this.section,
      required this.titulo,
      required this.subtitulo,
      required this.contenido,
      required this.reves,
      required this.nombreProducto,
      required this.categoria,
      required this.subcategoria,
      required this.beneficios,
      required this.caracteristicas,
      required this.ancho,
      required this.alto,
      required this.useScroll,
      required this.page});

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
        id: json['id'] ?? '',
        section: json['section'] ?? '',
        titulo: json['titulo'] ?? '',
        subtitulo: json['subtitulo'] ?? '',
        contenido: json['contenido'] ?? '',
        reves: json['reves'] ?? '',
        nombreProducto: json['nombreproducto'] ?? '',
        categoria: json['categoria'] ?? '',
        subcategoria: json['subcategoria'] ?? '',
        beneficios: json['beneficios'] ?? '',
        caracteristicas: json['caracteristicas'] ?? '',
        ancho: json['ancho'] ?? '',
        alto: json['alto'] ?? '',
        useScroll: json['usescroll'] ?? '',
        page: json['pageview'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'section': section,
      'titulo': titulo,
      'subtitulo': subtitulo,
      'contenido': contenido,
      'reves': reves,
      'nombreproducto': nombreProducto,
      'categoria': categoria,
      'subcategoria': subcategoria,
      'beneficios': beneficios,
      'caracteristicas': caracteristicas,
      'ancho': ancho,
      'alto': alto,
      'usescroll': useScroll,
      'pageview': page
    };
  }
}
