// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productos/app/data/models/productos.dart';

import 'package:productos/app/data/providers/producto_provider.dart';
import 'package:productos/app/modules/editar_producto/widgets/text_field_editar_producto.dart';

class EditarProductoController extends GetxController {
  final ProductoProvider _productoProvider = ProductoProvider();

  String? _nombreProducto = '';
  List<Producto> _productos = [];
  List<Producto> _productosTemp = [];

  String? _nombre, _linea;
  String? _cantidad;
  String? _precio;

  String? get nombreProducto => _nombreProducto;
  List<Producto> get productos => _productos;
  List<Producto> get productosTemp => _productosTemp;

  String? get nombre => _nombre;
  String? get linea => _linea;
  String? get cantidad => _cantidad;
  String? get precio => _precio;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadProductos();
  }

  void setProducto(String nombre) {
    this._nombre = nombre;
  }

  void setLinea(String linea) {
    this._linea = linea;
  }

  void setCantidad(String cantidad) {
    this._cantidad = cantidad;
  }

  void setPrecio(String precio) {
    this._precio = precio;
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
      print(productosTemp);
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: Icon(Icons.photo_size_select_actual),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: Icon(Icons.camera_alt),
                    //     ),
                    //   ],
                    // ),
                    Container(
                      child: Image.network(
                          _productosTemp[index].imagePath.toString()),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFieldEditarProducto(
                      onTextChanged: setProducto,
                      labaelNombre: 'Nombre',
                      nombre: _productosTemp[index].nombre.toString(),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFieldEditarProducto(
                      onTextChanged: setLinea,
                      labaelNombre: 'Linea',
                      nombre: _productosTemp[index].linea.toString(),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFieldEditarProducto(
                      onTextChanged: setCantidad,
                      labaelNombre: 'Cantidad',
                      nombre: _productosTemp[index].cantidad.toString(),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFieldEditarProducto(
                      onTextChanged: setPrecio,
                      labaelNombre: 'Precio',
                      nombre: _productosTemp[index].precio.toString(),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    RaisedButton.icon(
                      onPressed: () async {
                        llenadoDeDatos(index);
                        await loadProductos();
                        Get.back();
                      },
                      label: Text('EDITAR'),
                      icon: Icon(Icons.edit),
                      color: Color.fromRGBO(241, 142, 172, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
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

  void llenadoDeDatos(int index) async {
    try {
      await _productoProvider.editarProducto(
        id: productosTemp[index].id,
        nombre: nombre ?? productosTemp[index].nombre.toString(),
        linea: linea ?? productosTemp[index].linea.toString(),
        cantidad: cantidad == null
            ? productosTemp[index].cantidad
            : int.parse(cantidad.toString()),
        precio: precio == null
            ? productosTemp[index].precio
            : double.parse(precio.toString()),
        imagePath: productosTemp[index].imagePath,
      );
    } catch (e) {
      print(e);
    }
  }
}
