import 'package:get/get.dart';
import 'package:productos/app/modules/crear_producto/crear_producto_controller.dart';

class CrearProductoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CrearProductoController());
  }
}
