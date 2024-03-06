import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/connection/function/consultform.dart';

import 'circuletab.dart';

class FormContacto extends StatefulWidget {
  const FormContacto({super.key});

  @override
  State<FormContacto> createState() => _FormContactoState();
}

class _FormContactoState extends State<FormContacto> {
  final nombre = TextEditingController();
  final apellido = TextEditingController();
  final email = TextEditingController();
  final telefono = TextEditingController();
  final empresa = TextEditingController();
  final webempresa = TextEditingController();
  final consulta = TextEditingController();
  final mensaje = TextEditingController();
  final _keyform = GlobalKey<FormState>();
  String selectedOption = '';

  List<String> opcionconsulta = [
    "Cual es el motivo de su consulta",
    "Hablar con un Asesor",
    "Consejo sobre como equipar mi punto de venta",
    "Informacion del Producto",
    "Solicitar Demostracion",
    "Convertirme en Distribuidor"
  ];

  @override
  void dispose() {
    nombre.dispose();
    apellido.dispose();
    email.dispose();
    telefono.dispose();
    empresa.dispose();
    webempresa.dispose();
    consulta.dispose();
    mensaje.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    debugPrint(width.toString());
    return Container(
      width: width > 1000 ? 900 : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: const Text(
              "PERMITENOS CONOCERTE UN POCO MAS PARA PODER ASESORARTE MEJOR",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "CenturyGothic",
                fontSize: 20,
                color: Color.fromARGB(255, 0, 112, 192),
              ),
            ),
            actions: [
              CirculoTap(
                function: () => Get.back(),
                icon: Icons.logout,
                ini: Colors.white,
                fin: const Color.fromARGB(255, 0, 112, 192),
                sizeicon: 20,
                backgroundsize: 10,
              ),
            ],
          ),
          body: Center(
            child: Form(
              key: _keyform,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    width > 880
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InputFormcontact(
                                controller: nombre,
                                titulo: "NOMBRE",
                              ),
                              InputFormcontact(
                                controller: apellido,
                                titulo: "APELLIDOS",
                              )
                            ],
                          )
                        : Column(
                            children: [
                              InputFormcontact(
                                controller: nombre,
                                titulo: "NOMBRE",
                              ),
                              InputFormcontact(
                                controller: apellido,
                                titulo: "APELLIDOS",
                              )
                            ],
                          ),
                    width > 880
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InputFormcontact(
                                controller: email,
                                titulo: "E-MAIL",
                              ),
                              InputFormcontact(
                                controller: telefono,
                                titulo: "TELEFONO",
                              )
                            ],
                          )
                        : Column(
                            children: [
                              InputFormcontact(
                                controller: email,
                                titulo: "E-MAIL",
                              ),
                              InputFormcontact(
                                controller: telefono,
                                titulo: "TELEFONO",
                              )
                            ],
                          ),
                    width > 880
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InputFormcontact(
                                controller: empresa,
                                titulo: "EMPRESA",
                              ),
                              InputFormcontact(
                                controller: webempresa,
                                titulo: "WEB EMPRESA - Opcional",
                              )
                            ],
                          )
                        : Column(
                            children: [
                              InputFormcontact(
                                controller: empresa,
                                titulo: "EMPRESA",
                              ),
                              InputFormcontact(
                                controller: webempresa,
                                titulo: "WEB EMPRESA - Opcional",
                              )
                            ],
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "EN QUE PODEMOS AYUDARTE",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "CenturyGothic",
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: consulta.text.isEmpty
                                  ? opcionconsulta.first
                                  : consulta.text,
                              style: const TextStyle(fontFamily: "Poppins"),
                              borderRadius: BorderRadius.circular(10),
                              items: opcionconsulta.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child:
                                      SizedBox(width: 676, child: Text(value)),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  selectedOption = value ?? '';
                                  consulta.text = value ?? '';
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    InputFormcontact(
                      controller: mensaje,
                      titulo: "MENSAJE",
                      maxlines: 5,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_keyform.currentState!.validate()) {
                          final send = ConsulFormHttp();
                          bool resul = await send.sendemailform(
                              nombre.text,
                              apellido.text,
                              email.text,
                              telefono.text,
                              empresa.text,
                              webempresa.text,
                              consulta.text,
                              mensaje.text);
                          if (resul) {
                            Get.snackbar(
                                "Exito", "Tu correo se envio exitosamente");
                          } else {
                            Get.snackbar("Opps!", "Hubo un error");
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Conversemos",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputFormcontact extends StatefulWidget {
  const InputFormcontact({
    super.key,
    required this.controller,
    required this.titulo,
    this.maxlines,
  });

  final TextEditingController controller;
  final String titulo;
  final int? maxlines;

  @override
  State<InputFormcontact> createState() => _InputFormcontactState();
}

class _InputFormcontactState extends State<InputFormcontact> {
  String? error;
  @override
  Widget build(BuildContext context) {
    double width2 = MediaQuery.of(context).size.width;
    return Container(
      width: width2 > 880
          ? 400
          : width2 < 600
              ? 450
              : width2 / 1.2,
      height: widget.maxlines != null ? 200 : 70,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                setState(() {
                  error = "No puede ser vacia";
                });
              }
              return null;
            },
            controller: widget.controller,
            maxLines: widget.maxlines ?? 1,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              label: Text(widget.titulo),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
            child: error != null ? Text(error!) : null,
          )
        ],
      ),
    );
  }
}
