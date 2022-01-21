// ignore_for_file: deprecated_member_use

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productos/app/data/models/usuarios.dart';
import 'package:productos/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final FirebaseDatabase _firebaseDatabase = Get.find<FirebaseDatabase>();
  final DatabaseReference _reference = FirebaseDatabase.instance.ref("usuario");

  List<dynamic> _usuarios = [];
  String? _nombre = '', _password = '', _id = '';

  Usuario? _usuario;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void onChangeTextNombre(String text) {
    this._nombre = text;
  }

  void onChangeTextPassword(String text) {
    this._password = text;
  }

  void ingresarHome() async {
    DatabaseEvent event = await _reference.once();
    dynamic data = event.snapshot.value;

    data.forEach((k, v) {
      print(v);
      if (v["nombre"] == _nombre) {
        _id = k.toString();
      } else {
        print('ERROR ::::::::::::::::::::::::::::::::');
      }
    });

    DatabaseReference _referencia =
        FirebaseDatabase.instance.ref("usuario/$_id");

    DatabaseEvent evento = await _referencia.once();
    dynamic datos = evento.snapshot.value;

    String? nombreProvidencial = datos["nombre"];
    String? passwordProvidencial = datos["password"].toString();

    if (nombreProvidencial == _nombre && passwordProvidencial == _password) {
      Get.offNamed(AppRoutes.HOME);
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text(
            "ERROR",
            style: TextStyle(
              color: Color.fromRGBO(241, 142, 172, 1.0),
            ),
          ),
          content: const Text(
            "No se pudo iniciar sesion. \nEl nombre o la contraseña que digitó es errónea",
            style: TextStyle(
              color: Color.fromRGBO(241, 142, 172, 1.0),
            ),
          ),
          backgroundColor: Color.fromRGBO(52, 54, 101, 1.0),
          actions: [
            FlatButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'ACEPTAR',
                style: TextStyle(
                  color: Color.fromRGBO(241, 142, 172, 1.0),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
