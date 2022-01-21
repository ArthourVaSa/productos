import 'dart:convert';

class Producto {
  Producto({
    required this.cantidad,
    required this.linea,
    required this.nombre,
    required this.precio,
    required this.imagePath,
  });

  final int? cantidad;
  final String? linea;
  final String? nombre;
  final int? precio;
  final String? imagePath;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        cantidad: json["cantidad"],
        linea: json["linea"],
        nombre: json["nombre"],
        precio: json["precio"],
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "linea": linea,
        "nombre": nombre,
        "precio": precio,
        "imagePath": imagePath,
      };
}
