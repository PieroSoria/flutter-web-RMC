import 'package:flutter/material.dart';
import 'package:rmc_bussiness/components/widget/text_tap.dart';

class FoorterPage extends StatefulWidget {
  const FoorterPage({super.key});

  @override
  State<FoorterPage> createState() => _FoorterPageState();
}

class _FoorterPageState extends State<FoorterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 112, 192),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/image/principal.png",
                      width: 300,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  const Text(
                    "RMC SOLUTIONS & BUSSINES",
                    style: TextStyle(
                      fontFamily: "CenturyGothic",
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 240,
                    child: Text(
                      "Copyright © 2023 RMC Solutions & Business.Todos los derechos reservados",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "RMC Solutions & Business",
                            style: TextStyle(
                              fontFamily: "CenturyGothic",
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          TextOnTap(
                            titulo: 'Quienes Somos',
                            press: () {},
                          ),
                          TextOnTap(
                            titulo: 'Blog',
                            press: () {},
                          ),
                          TextOnTap(
                            titulo: 'Contacto',
                            press: () {},
                          ),
                          TextOnTap(
                            titulo: 'Proguntas Frecuentes',
                            press: () {},
                          ),
                          TextOnTap(
                            titulo: 'Politicas de Privacidad',
                            press: () {},
                          ),
                          TextOnTap(
                            titulo: 'Terminos y condiciones',
                            press: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "AYUDA",
                            style: TextStyle(
                              fontFamily: "CenturyGothic",
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          TextOnTap(titulo: "Drive", press: () {}),
                          TextOnTap(titulo: "Compra Online", press: () {}),
                          TextOnTap(titulo: "Pago", press: () {}),
                          TextOnTap(titulo: "Envio", press: () {}),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 290,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Contactos",
                            style: TextStyle(
                              fontFamily: "CenturyGothic",
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            child: InkWell(
                              child: Column(
                                children: [
                                  Text(
                                    "Ubicacion",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "AV. CHIMU 283, VILLA MARIA DEL TRIUNFO, LIMA",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            child: InkWell(
                              child: Column(
                                children: [
                                  Text(
                                    "Whatsapp",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "+51 981 229 283",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            child: InkWell(
                              child: Column(
                                children: [
                                  Text(
                                    "Email",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "COMERCIAL@RMC.PE",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
