import 'package:flutter/material.dart';
import 'package:productos/app/data/models/productos.dart';
import 'package:productos/app/modules/editar_producto/editar_producto_controller.dart';

class ProductoItem extends StatelessWidget {
  final Producto? producto;
  EditarProductoController editarProductoController;
  int index;
  ProductoItem(
      {Key? key,
      required this.producto,
      required this.editarProductoController,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: producto!.imagePath == null
          ? Image(image: AssetImage('assets/no-image.png'))
          : Image.network(producto!.imagePath.toString()),
      title: Text(producto!.nombre.toString()),
      subtitle: Text(
          'Cantidad: ${producto!.cantidad}\nLínea: ${producto!.linea}\nPrecio: ${producto!.precio}'),
      onTap: () {
        editarProductoController.productoPresionado(index);
      },
    );
  }
}
