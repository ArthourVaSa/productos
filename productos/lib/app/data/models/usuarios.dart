import 'package:meta/meta.dart' show required;

class Usuario {
  Usuario({
    @required this.id,
    @required this.nombre,
    @required this.password,
    @required this.rol,
  });

  String? id;
  final String? nombre;
  final String? password;
  final String? rol;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json['id'],
        nombre: json["nombre"],
        password: json["password"].toString(),
        rol: json["rol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "password": password,
        "rol": rol,
      };
}
