import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productos/app/data/models/productos.dart';
import 'package:productos/app/modules/editar_producto/editar_producto_controller.dart';
import 'package:productos/app/modules/editar_producto/widgets/producto_item_widget.dart';

class EditarProductoPage extends StatelessWidget {
  const EditarProductoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditarProductoController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Editar Producto'),
        ),
        body: Container(
          child: Column(
            children: [
              _buscador(_),
              Expanded(
                flex: 6,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    final Producto producto = _.productosTemp[index];
                    return ProductoItem(
                      producto: producto,
                      editarProductoController: _,
                      index: index,
                    );
                  },
                  itemCount: _.productosTemp.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buscador(EditarProductoController _) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 15.0),
      child: TextField(
        onChanged: _.onNombreProductoChange,
      ),
    );
  }
}
