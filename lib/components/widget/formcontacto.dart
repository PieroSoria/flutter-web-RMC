import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return Container(
      width: 1000,
      height: 900,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Form(
              key: _keyform,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: 900,
                      child: Text(
                        "PERMITENOS CONOCERTE UN POCO MAS PARA PODER ASESORARTE MEJOR",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "CenturyGothic",
                          fontSize: 30,
                          color: Color.fromARGB(255, 0, 112, 192),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 400,
                        height: 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "NOMBRE",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "CenturyGothic",
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "No puede ser vacia";
                                }
                                return null;
                              },
                              controller: nombre,
                              style: const TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        height: 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "APELLIDO",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "CenturyGothic",
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            TextFormField(
                              controller: apellido,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "No puede ser vacia";
                                }
                                return null;
                              },
                              style: const TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 400,
                        height: 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "E-MAIL",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "CenturyGothic",
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            TextFormField(
                              controller: email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "No puede ser vacia";
                                } else if (!value.contains("@")) {
                                  return "No es un correo electronico";
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.singleLineFormatter,
                              ],
                              style: const TextStyle(fontSize: 16),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        height: 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "TELEFONO",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "CenturyGothic",
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            TextFormField(
                              controller: telefono,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "El número de teléfono no puede ser vacío";
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(9),
                              ],
                              style: const TextStyle(fontSize: 16),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 400,
                        height: 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "EMPRESA",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "CenturyGothic",
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            TextFormField(
                              controller: empresa,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Empresa no puede estar vacia";
                                }
                                return null;
                              },
                              style: const TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        height: 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "WEB EMPRESA - Opcional",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "CenturyGothic",
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            TextFormField(
                              controller: webempresa,
                              style: const TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 700,
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "EN QUE PODEMOS AYUDARTE",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: "CenturyGothic",
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        // SizedBox(
                        //   height: 50,
                        //   child: TextFormField(
                        //     controller: consulta,
                        //     decoration: InputDecoration(
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //     ),
                        //   ),
                        // )
                        SizedBox(
                          width: 700,
                          height: 50,
                          child: DropdownButton<String>(
                            value: consulta.text.isEmpty
                                ? opcionconsulta.first
                                : consulta.text,
                            style: const TextStyle(fontFamily: "Poppins"),
                            borderRadius: BorderRadius.circular(10),
                            items: opcionconsulta.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: SizedBox(width: 676, child: Text(value)),
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
                  SizedBox(
                    width: 700,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "MENSAJE",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: "CenturyGothic",
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          child: TextFormField(
                            controller: mensaje,
                            style: const TextStyle(fontSize: 16),
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
          Positioned(
            top: 20,
            right: 20,
            child: CirculoTap(
              function: () => Navigator.of(context).pop(),
              icon: Icons.arrow_forward_ios_rounded,
              ini: Colors.white,
              fin: const Color.fromARGB(255, 0, 112, 192),
              sizeicon: 35,
              backgroundsize: 15,
            ),
          )
        ],
      ),
    );
  }
}
