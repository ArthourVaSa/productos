import 'dart:convert';

class Producto {
  Producto({
    required this.id,
    required this.cantidad,
    required this.linea,
    required this.nombre,
    required this.precio,
    required this.imagePath,
  });

  String? id;
  final int? cantidad;
  final String? linea;
  final String? nombre;
  final double? precio;
  final String? imagePath;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        cantidad: json["cantidad"],
        linea: json["linea"],
        nombre: json["nombre"],
        precio: double.parse(json["precio"].toString()),
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cantidad": cantidad,
        "linea": linea,
        "nombre": nombre,
        "precio": precio,
        "imagePath": imagePath,
      };
}
