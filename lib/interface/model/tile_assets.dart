class Tileasset {
  String? title;
  List<String>? dropdownItems;

  Tileasset({this.title, this.dropdownItems});
}

List<Tileasset> sideMenustile = [
  Tileasset(
    title: "Soluciones",
    dropdownItems: [
      "Retail",
      "Restaurante ",
      "Autoservicio",
      "Almacen e inventarios"
    ],
  ),
  Tileasset(
    title: "Punto de Venta",
    dropdownItems: ["De escritorio", "Movil"],
  ),
  Tileasset(
    title: "Lectores de Codigo de Barra",
  ),
  Tileasset(
    title: "Impresoras",
    dropdownItems: [
      "Impresoras Termicas de ticket",
      "Impresora codigo de barra",
      "Impresora Termica portatiles"
    ],
  ),
  Tileasset(
    title: "Quiosco de autoservicio",
  ),
  Tileasset(title: "Contacto")
];
