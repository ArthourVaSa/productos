import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productos/app/data/providers/producto_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:uuid/uuid.dart';

class CrearProductoController extends GetxController {
  final ProduuctoProvider _produuctoProvider = ProduuctoProvider();
  final ImagePicker _picker = ImagePicker();

  String? _producto = '', _linea = '';
  int? _cantidad = 0;
  double? _precio = 0.0;
  XFile? _foto;
  File? file;

  final TextEditingController controllerNombre = TextEditingController();
  final TextEditingController controllerLinea = TextEditingController();
  final TextEditingController controllerCantidad = TextEditingController();
  final TextEditingController controllerPrecio = TextEditingController();

  String? get producto => _producto;
  String? get linea => _linea;
  int? get cantidad => _cantidad;
  double? get precio => _precio;
  XFile? get foto => _foto;

  void setProducto(String producto) {
    this._producto = producto;
  }

  void setLinea(String linea) {
    this._linea = linea;
  }

  void setCantidad(String cantidad) {
    this._cantidad = int?.parse(cantidad);
  }

  void setPrecio(String precio) {
    this._precio = double?.parse(precio);
  }

  void tomarFoto() async {
    _foto = await _picker.pickImage(source: ImageSource.camera);

    update();
  }

  void seleccionarFoto() async {
    _foto = await _picker.pickImage(source: ImageSource.gallery);

    update();
  }

  void llenadoDeDatos() async {
    file = File(foto!.path);
    String? nombreImagen = Uuid().v1();
    String? imagePath = 'producto/$nombreImagen';
    String? urlImage;

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref(imagePath)
          .putFile(file!);

      urlImage = await firebase_storage.FirebaseStorage.instance
          .ref(imagePath)
          .getDownloadURL();
    } catch (e) {
      print("ERROR:::::::::::::::::::::: $e");
    }

    try {
      await _produuctoProvider.crearNuevoProducto(
        nombre: producto,
        linea: linea,
        cantidad: cantidad,
        precio: precio,
        imagePath: urlImage,
      );
    } catch (e) {
      print("ERROR:::::::::::::::: $e");
    }

    controllerNombre.clear();
    controllerLinea.clear();
    controllerCantidad.clear();
    controllerPrecio.clear();

    Get.back();
  }
}
