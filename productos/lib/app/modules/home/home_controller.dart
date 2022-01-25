import 'package:get/get.dart';
import 'package:productos/app/routes/app_routes.dart';

class HomeController extends GetxController {
  String? _action = '';

  String? get action => _action;

  void actionValue(String texto) {
    this._action = texto;
  }

  void irATarea() {
    switch (action) {
      case 'Crear Producto':
        Get.toNamed(AppRoutes.CREAR_PRODUCTO);
        break;
      case 'Editar Producto':
        Get.toNamed(AppRoutes.EDITAR_PRODUCTO);
        break;
      case 'Eliminar Producto':
        Get.toNamed(AppRoutes.ELIMINAR_PRODUCTO);
        break;
      case 'Ver Producto':
        Get.toNamed(AppRoutes.VER_PRODUCTO);
        break;
      case 'Crear Usuario':
        Get.toNamed(AppRoutes.CREAR_USUARIO);
        break;
      case 'Ver y editar Usuario':
        Get.toNamed(AppRoutes.VER_EDITAR_USUARIO);
        break;
      case 'Eliminar Usuario':
        Get.toNamed(AppRoutes.ELIMINAR_USUARIO);
        break;
      case 'Cerrar Sesión':
        Get.toNamed(AppRoutes.LOGIN);
        break;
      default:
    }
  }
}
