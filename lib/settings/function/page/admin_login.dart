import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/admin_controller.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final controlleradmin = Get.put(SettingsAdmin());
  final _keyform = GlobalKey<FormState>();
  final user = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white70),
      width: 400,
      height: 300,
      child: Form(
        key: _keyform,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Email",
              style: TextStyle(
                fontFamily: "CenturyGothic",
                fontSize: 25,
              ),
            ),
            TextFormField(
              controller: user,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Emil no puede ser nulo";
                } else if (!value.contains("@")) {
                  return "no es un correo";
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                prefixIconColor: Colors.red,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Text(
              "Password",
              style: TextStyle(
                fontFamily: "CenturyGothic",
                fontSize: 25,
              ),
            ),
            TextFormField(
              controller: password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password no puede ser nulo";
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.lock,
                    size: 40,
                  ),
                ),
                prefixIconColor: Colors.red,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_keyform.currentState!.validate()) {
                  bool result = await controlleradmin.loginadmin(
                      user.text, password.text);
                  if (result) {
                    Get.snackbar("exito", "se logeo");
                    controlleradmin.ini(true);
                  } else {
                    Get.snackbar("Opps", "error");
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
              ),
              child: const Text(
                "Iniciar Session",
                style: TextStyle(
                  fontFamily: "CenturyGothic",
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
