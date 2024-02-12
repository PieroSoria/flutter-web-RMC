import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmc_bussiness/settings/routes/app_routes.dart';
import 'package:rmc_bussiness/settings/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RMC Bussiness',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.admindesktop,
      getPages: approutes,
    );
  }
}
