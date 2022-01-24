import 'package:get/get.dart';
import 'package:productos/app/modules/eliminar_producto/eliminar_producto_controller.dart';

class EliminarProductoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EliminarProductoController(),
    );
  }
}
