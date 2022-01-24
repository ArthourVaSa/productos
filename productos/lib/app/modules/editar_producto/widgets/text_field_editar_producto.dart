import 'package:flutter/material.dart';
import 'package:productos/app/data/models/productos.dart';

class TextFieldEditarProducto extends StatelessWidget {
  Function(String)? onTextChanged;

  String? nombre, linea, nulo = '', labaelNombre;
  int? cantidad;
  double? precio;
  TextFieldEditarProducto(
      {Key? key,
      required this.onTextChanged,
      required this.labaelNombre,
      this.nombre,
      this.linea,
      this.cantidad,
      this.precio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: (nombre == null && linea == null && cantidad == null)
          ? precio.toString()
          : (nombre == null && linea == null && precio == null)
              ? cantidad.toString()
              : (nombre == null && precio == null && cantidad == null)
                  ? linea
                  : (linea == null && cantidad == null && precio == null)
                      ? nombre
                      : nulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: labaelNombre),
      onChanged: onTextChanged,
    );
  }
}
