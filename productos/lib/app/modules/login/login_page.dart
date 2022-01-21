// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productos/app/modules/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Scaffold(
        body: Stack(
          children: [
            _fondoPantalla(),
            _loginForm(context, _),
          ],
        ),
      ),
    );
  }

  Widget _fondoPantalla() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(37, 37, 57, 1.0),
          ],
        ),
      ),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0),
            ],
          ),
        ),
      ),
    );

    final cajaRosa2 = Transform.rotate(
      angle: pi / -5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0),
            ],
          ),
        ),
      ),
    );

    return Stack(
      children: [
        gradiente,
        Positioned(
          child: cajaRosa,
          top: -90.0,
        ),
        Positioned(
          child: cajaRosa2,
          bottom: -90.0,
          left: 100.0,
        ),
      ],
    );
  }

  Widget _loginForm(BuildContext context, LoginController _) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: FractionalOffset(0.0, 0.6),
                end: FractionalOffset(0.0, 1.0),
                colors: [
                  Color.fromRGBO(52, 54, 101, 1.0),
                  Color.fromRGBO(37, 37, 57, 1.0)
                ],
              ),
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  'Ingreso',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(241, 142, 172, 1.0),
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                _crearNombre(_),
                const SizedBox(
                  height: 30.0,
                ),
                _crearPassword(_),
                const SizedBox(
                  height: 40.0,
                ),
                _crearBoton(_),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearNombre(LoginController _) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        onChanged: _.onChangeTextNombre,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.person,
            color: Color.fromRGBO(241, 142, 172, 1.0),
          ),
          labelText: 'Nombre',
          labelStyle: TextStyle(
            color: Color.fromRGBO(241, 142, 172, 1.0),
          ),
        ),
        style: TextStyle(
          color: Color.fromRGBO(241, 142, 172, 1.0),
        ),
      ),
    );
  }

  Widget _crearPassword(LoginController _) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        onChanged: _.onChangeTextPassword,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.lock_outline,
            color: Color.fromRGBO(241, 142, 172, 1.0),
          ),
          labelText: 'Contraseña',
          labelStyle: TextStyle(
            color: Color.fromRGBO(241, 142, 172, 1.0),
          ),
        ),
        style: TextStyle(
          color: Color.fromRGBO(241, 142, 172, 1.0),
        ),
      ),
    );
  }

  Widget _crearBoton(LoginController _) {
    return RaisedButton(
      onPressed: _.ingresarHome,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: const Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0.0,
      color: const Color.fromRGBO(241, 142, 172, 1.0),
      textColor: const Color.fromRGBO(37, 37, 57, 1.0),
    );
  }
}
