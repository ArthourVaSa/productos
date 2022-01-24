import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productos/app/data/models/productos.dart';
import 'package:productos/app/data/providers/producto_provider.dart';

class VerProductoController extends GetxController {
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
      print(nombreTitulo);
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

  void productoPresionado(int index) async {
    Get.dialog(
      AlertDialog(
        actions: [
          Container(
            width: 300,
            height: 400,
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Image.network(
                          _productosTemp[index].imagePath.toString()),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text('Nombre'),
                    Text(
                      _productosTemp[index].nombre.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text('Linea'),
                    Text(
                      _productosTemp[index].linea.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text('Cantidad'),
                    Text(
                      _productosTemp[index].cantidad.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text('Precio'),
                    Text(
                      _productosTemp[index].precio.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
