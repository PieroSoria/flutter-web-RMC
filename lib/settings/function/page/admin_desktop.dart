import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rmc_bussiness/settings/function/model/tilesection.dart';
import 'package:rmc_bussiness/settings/function/page/vistadelossection.dart';
import 'package:rmc_bussiness/settings/function/widget/formsection.dart';

import '../controller/admin_controller.dart';
import '../widget/icontap.dart';

class AdminDesktop extends StatefulWidget {
  const AdminDesktop({super.key});

  @override
  State<AdminDesktop> createState() => _AdminDesktopState();
}

class _AdminDesktopState extends State<AdminDesktop> {
  final controlleradmin = Get.put(SettingsAdmin());

  @override
  void dispose() {
    controlleradmin.onDelete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: width < 900
          ? AppBar(
              title: const Text(
                "Secciones",
                style: TextStyle(
                  fontFamily: "CenturyGothic",
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    controlleradmin.ini(false);
                  });
                },
                icon: const Icon(Icons.logout),
              ),
            )
          : null,
      floatingActionButton: width > 600
          ? IconTap(
              funcion: () {
                Get.toNamed('/Productosmode');
              },
              titulo: "Productos",
            )
          : IconButton(
              onPressed: () {
                Get.toNamed('/Productosmode');
              },
              icon: const Icon(Icons.shopping_bag_outlined),
            ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/fondo.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: width > 900
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 500,
                    height: 900,
                    child: const SingleChildScrollView(
                      child: FormSection(
                        id: '',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 40),
                    width: 1000,
                    height: 900,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const VistadelosSection(),
                  ),
                ],
              )
            : const FormSection(
                id: '',
              ),
      ),
    );
  }
}
