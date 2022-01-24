import 'package:flutter/material.dart';
import 'package:productos/app/data/models/productos.dart';
import 'package:productos/app/modules/ver_producto/ver_producto_controller.dart';

class ProductoItem extends StatelessWidget {
  final Producto? producto;
  VerProductoController verProductoController;
  int index;
  ProductoItem(
      {Key? key,
      required this.producto,
      required this.verProductoController,
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
        verProductoController.productoPresionado(index);
      },
    );
  }
}
