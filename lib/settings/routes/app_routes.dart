import 'package:get/get.dart';
import 'package:rmc_bussiness/components/widget/card_product.dart';
import 'package:rmc_bussiness/settings/function/page/actualizar_section.dart';
import 'package:rmc_bussiness/settings/function/page/admin_desktop.dart';
import 'package:rmc_bussiness/settings/function/page/admin_settings.dart';
import 'package:rmc_bussiness/settings/function/page/productos/productos.dart';

import '../../interface/page/index.dart';
import 'routes.dart';

// Map<String, Widget Function(BuildContext)> get approutess => {
//       Routes.index: (_) => const Index(),
//       Routes.admin: (_) => const AdminScreen(),
//       Routes.admindesktop: (_) => const AdminDesktop(),
//     };

List<GetPage<dynamic>>? get approutes => [
      GetPage(
        name: Routes.index,
        page: () => const Index(),
      ),
      GetPage(
        name: Routes.admin,
        page: () => const AdminScreen(),
      ),
      GetPage(
        name: Routes.admindesktop,
        page: () => const AdminDesktop(),
      ),
      GetPage(
        name: Routes.product,
        page: () => const CardProduct(),
        arguments: null,
      ),
      GetPage(
        name: Routes.actualizarsection,
        page: () => const ActualizarSection(),
        arguments: 0,
      ),
      GetPage(
        name: Routes.modeproductos,
        page: () => const ProductosScreen(),
      )
    ];
