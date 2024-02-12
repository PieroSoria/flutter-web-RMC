import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/admin_controller.dart';
import '../widget/formsection.dart';

class ActualizarSection extends StatefulWidget {
  const ActualizarSection({super.key});

  @override
  State<ActualizarSection> createState() => _ActualizarSectionState();
}

class _ActualizarSectionState extends State<ActualizarSection> {
  final controlleradmin = Get.put(SettingsAdmin());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/fondo.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(207, 173, 173, 173),
              borderRadius: BorderRadius.circular(20),
            ),
            width: 900,
            height: MediaQuery.of(context).size.height,
            child: FormSection(
              id: controlleradmin.sectionactual[controlleradmin.index.value].id,
            ),
          ),
        ),
      ),
    );
  }
}
