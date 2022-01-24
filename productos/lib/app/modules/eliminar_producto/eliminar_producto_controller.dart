import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productos/app/data/models/productos.dart';
import 'package:productos/app/data/providers/producto_provider.dart';

class EliminarProductoController extends GetxController {
  final ProductoProvider _productoProvider = ProductoProvider();

  String? _nombreProducto = '';
  List<Producto> _productos = [];
  List<Producto> _productosTemp = [];

  String? get nombreProducto => _nombreProducto;
  List<Producto> get productos => _productos;
  List<Producto> get productosTemp => _productosTemp;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadProductos();
  }

  void onNombreProductoChange(String nombre) {
    this._nombreProducto = nombre;

    _productosTemp = _productos.where((producto) {
      dynamic nombreTitulo = producto.nombre!.toLowerCase();
      return nombreTitulo.contains(nombre);
    }).toList();

    update();
  }

  Future<void> loadProductos() async {
    try {
      _productos = await _productoProvider.traerProductos();
      _productosTemp = _productos;
      update();
    } catch (e) {
      print(e);
    }
  }

  void eliminarProductos(int index) async {
    try {
      await _productoProvider.eliminarProductos(id: productosTemp[index].id);
      await loadProductos();
    } catch (e) {
      print(e);
    }
  }
}
