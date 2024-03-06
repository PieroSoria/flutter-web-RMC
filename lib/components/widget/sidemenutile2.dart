import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/components/widget/formcontacto.dart';
import 'package:rmc_bussiness/controller/widget/selectwidget.dart';

class SideMenuTile2 extends StatefulWidget {
  final String? titulo;
  final List<String>? dropmenuitem;
  final VoidCallback press;
  const SideMenuTile2({
    super.key,
    this.titulo,
    this.dropmenuitem,
    required this.press,
  });

  @override
  State<SideMenuTile2> createState() => _SideMenuTile2State();
}

class _SideMenuTile2State extends State<SideMenuTile2> {
  final controllerwidget = Get.put(WidgetController());
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: ListTile(
            title: Text(widget.titulo!),
            trailing: widget.dropmenuitem != null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    icon: expanded
                        ? const Icon(Icons.arrow_drop_up)
                        : const Icon(Icons.arrow_drop_down_sharp),
                  )
                : null,
            onTap: () {
              switch (widget.titulo) {
                case "Soluciones":
                  controllerwidget.indexwidget(1);
                  break;
                case "Punto de Venta":
                  controllerwidget.indexwidget(6);
                  break;
                case "Lectores de Codigo de Barra":
                  controllerwidget.futuresection.clear();
                  controllerwidget.indexwidget(9);
                  break;
                case "Quiosco de autoservicio":
                  controllerwidget.futuresection.clear();
                  controllerwidget.indexwidget(14);
                  break;
                case "Impresoras":
                  controllerwidget.indexwidget(10);
                  break;
                case "Contacto":
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Dialog(
                        child: FormContacto(),
                      );
                    },
                  );
                  break;
              }

              Scaffold.of(context).closeEndDrawer();
            },
          ),
        ),
        Container(
          child: expanded
              ? Column(
                  children: [
                    ...widget.dropmenuitem!.map(
                      (value) => TextButton(
                        onPressed: () {
                          switch (value) {
                            case "Retail":
                              controllerwidget.indexwidget(2);
                              break;
                            case "Restaurante":
                              controllerwidget.indexwidget(3);
                              break;
                            case "Autoservicio":
                              controllerwidget.indexwidget(4);
                              break;
                            case "Almacen e inventarios":
                              controllerwidget.indexwidget(5);
                              break;
                            case "De escritorio":
                              controllerwidget.indexwidget(7);
                              break;
                            case "Movil":
                              controllerwidget.indexwidget(8);
                              break;
                            case "Impresoras Termicas de ticket":
                              controllerwidget.indexwidget(11);
                              break;
                            case "Impresora codigo de barra":
                              controllerwidget.indexwidget(12);
                              break;
                            case "Impresora Termica portatiles":
                              controllerwidget.indexwidget(13);
                              break;
                          }
                          Scaffold.of(context).closeEndDrawer();
                        },
                        child: ListTile(
                          title: Text(value),
                        ),
                      ),
                    )
                  ],
                )
              : null,
        )
      ],
    );
  }
}
