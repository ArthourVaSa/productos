import 'package:get/get.dart';
import 'package:productos/app/modules/ver_producto/ver_producto_controller.dart';

class VerProductoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => VerProductoController(),
    );
  }
}
