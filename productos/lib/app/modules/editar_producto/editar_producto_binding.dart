import 'package:get/get.dart';
import 'package:productos/app/modules/editar_producto/editar_producto_controller.dart';

class EditarProductoBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(
      () => EditarProductoController(),
    );
  }
}
