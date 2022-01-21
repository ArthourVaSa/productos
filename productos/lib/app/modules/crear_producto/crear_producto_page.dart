// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productos/app/modules/crear_producto/crear_producto_controller.dart';

class CrearProducto extends StatelessWidget {
  CrearProducto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CrearProductoController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Crear Producto'),
          actions: [
            IconButton(
              onPressed: _.seleccionarFoto,
              icon: Icon(Icons.photo_size_select_actual),
            ),
            IconButton(
              onPressed: _.tomarFoto,
              icon: Icon(Icons.camera_alt),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Form(
              child: Column(
                children: [
                  Container(
                    child: _.foto?.path != null
                        ? Image.file(File(_.foto!.path))
                        : Image(image: AssetImage('assets/no-image.png')),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _crearNombre(_),
                  SizedBox(
                    height: 10.0,
                  ),
                  _crearLinea(_),
                  SizedBox(
                    height: 10.0,
                  ),
                  _crearCantidad(_),
                  SizedBox(
                    height: 10.0,
                  ),
                  _crearPrecio(_),
                  SizedBox(
                    height: 10.0,
                  ),
                  _btnConfirmador(_),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre(CrearProductoController _) {
    return TextFormField(
      controller: _.controllerNombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Producto'),
      onChanged: _.setProducto,
    );
  }

  Widget _crearLinea(CrearProductoController _) {
    return TextFormField(
      controller: _.controllerLinea,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Linea'),
      onChanged: _.setLinea,
    );
  }

  Widget _crearCantidad(CrearProductoController _) {
    return TextFormField(
      controller: _.controllerCantidad,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Cantidad'),
      onChanged: _.setCantidad,
    );
  }

  Widget _crearPrecio(CrearProductoController _) {
    return TextFormField(
      controller: _.controllerPrecio,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: 'Precio'),
      onChanged: _.setPrecio,
    );
  }

  Widget _btnConfirmador(CrearProductoController _) {
    return RaisedButton.icon(
      onPressed: _.llenadoDeDatos,
      label: Text('REGISTRAR'),
      icon: Icon(Icons.save),
      color: Color.fromRGBO(241, 142, 172, 1.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
