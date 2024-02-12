import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/settings/function/controller/admin_controller.dart';
import 'package:rmc_bussiness/settings/function/page/admin_desktop.dart';
import 'package:rmc_bussiness/settings/function/page/admin_login.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final controlleradmin = Get.put(SettingsAdmin());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Obx(
          () => controlleradmin.ini.value
              ? const AdminDesktop()
              : const Center(
                  child: SizedBox(
                    width: 500,
                    height: 400,
                    child: AdminLogin(),
                  ),
                ),
        ),
      ),
    );
  }
}
