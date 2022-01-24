import 'package:flutter/material.dart';
import 'package:productos/app/data/models/productos.dart';
import 'package:productos/app/modules/eliminar_producto/eliminar_producto_controller.dart';

class ProductoItem extends StatelessWidget {
  final Producto? producto;
  EliminarProductoController eliminarProductoController;
  int index;
  ProductoItem(
      {Key? key,
      required this.producto,
      required this.eliminarProductoController,
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
      trailing: IconButton(
        onPressed: () {
          eliminarProductoController.eliminarProductos(index);
        },
        icon: const Icon(
          Icons.delete,
          color: Color.fromRGBO(241, 142, 172, 1.0),
        ),
      ),
    );
  }
}
