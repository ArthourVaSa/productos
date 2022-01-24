import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:productos/app/data/models/productos.dart';

class ProductoProvider {
  final Dio _dio = Get.find<Dio>();

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

  Future<List<Producto>> traerProductos() async {
    final List<Producto> productos = [];
    final response = await _dio.get('producto.json');

    if (response.data == null) return [];

    response.data.forEach(
      (id, prod) {
        final prodTemp = Producto.fromJson(prod);
        prodTemp.id = id;

        productos.add(prodTemp);
      },
    );

    return productos;
  }

  Future<bool> editarProducto({
    required String? id,
    required String? nombre,
    required String? linea,
    required int? cantidad,
    required double? precio,
    required String? imagePath,
  }) async {
    final response = await _dio.put('producto/${id}.json', data: {
      "nombre": nombre,
      "linea": linea,
      "cantidad": cantidad,
      "precio": precio,
      "imagePath": imagePath,
    });

    return true;
  }

  Future<bool> eliminarProductos({
    required String? id,
  }) async {
    final response = await _dio.delete('producto/$id.json');

    return true;
  }
}
