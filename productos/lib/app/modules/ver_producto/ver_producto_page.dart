import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productos/app/data/models/productos.dart';
import 'package:productos/app/modules/ver_producto/ver_producto_controller.dart';
import 'package:productos/app/modules/ver_producto/widgets/producto_item_widget.dart';

class VerProductoPage extends StatelessWidget {
  const VerProductoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerProductoController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Ver Producto'),
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
                      verProductoController: _,
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

  Widget _buscador(VerProductoController _) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 15.0),
      child: TextField(
        onChanged: _.onNombreProductoChange,
      ),
    );
  }
}
