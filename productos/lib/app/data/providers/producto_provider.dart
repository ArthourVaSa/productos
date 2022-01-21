import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:productos/app/data/models/productos.dart';

class ProduuctoProvider {
  final Dio _dio = Get.find<Dio>();

  Producto? _producto;

  final String? url = '';

  Future<bool> crearNuevoProducto({
    required String? nombre,
    required String? linea,
    required int? cantidad,
    required double? precio,
    required String? imagePath,
  }) async {
    final response = await _dio.post('producto.json', data: {
      "nombre": nombre,
      "linea": linea,
      "cantidad": cantidad,
      "precio": precio,
      "imagePath": imagePath,
    });

    return true;
  }
}
