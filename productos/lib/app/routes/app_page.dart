import 'package:get/get.dart';
import 'package:productos/app/modules/crear_producto/crear_producto_binding.dart';
import 'package:productos/app/modules/crear_producto/crear_producto_page.dart';
import 'package:productos/app/modules/editar_producto/editar_producto_binding.dart';
import 'package:productos/app/modules/editar_producto/editar_producto_page.dart';
import 'package:productos/app/modules/eliminar_producto/eliminar_producto_binding.dart';
import 'package:productos/app/modules/eliminar_producto/eliminar_producto_page.dart';
import 'package:productos/app/modules/home/home_binding.dart';
import 'package:productos/app/modules/home/home_page.dart';
import 'package:productos/app/modules/login/login_binding.dart';
import 'package:productos/app/modules/login/login_page.dart';
import 'package:productos/app/modules/ver_producto/ver_producto_binding.dart';
import 'package:productos/app/modules/ver_producto/ver_producto_page.dart';
import 'package:productos/app/routes/app_routes.dart';

class AppPage {
  static final List<GetPage> page = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.CREAR_PRODUCTO,
      page: () => CrearProducto(),
      binding: CrearProductoBinding(),
    ),
    GetPage(
      name: AppRoutes.EDITAR_PRODUCTO,
      page: () => EditarProductoPage(),
      binding: EditarProductoBinding(),
    ),
    GetPage(
      name: AppRoutes.ELIMINAR_PRODUCTO,
      page: () => EliminarProductoPage(),
      binding: EliminarProductoBinding(),
    ),
    GetPage(
      name: AppRoutes.VER_PRODUCTO,
      page: () => VerProductoPage(),
      binding: VerProductoBinding(),
    ),
  ];
}
