import 'package:meta/meta.dart' show required;

class Usuario {
  Usuario({
    @required this.nombre,
    @required this.password,
    @required this.rol,
  });

  final String? nombre;
  final int? password;
  final String? rol;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        password: json["password"],
        rol: json["rol"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "password": password,
        "rol": rol,
      };
}
