import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productos/app/modules/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        body: Stack(
          children: [
            _fondoApp(),
            SingleChildScrollView(
              child: Column(
                children: [
                  _titulos(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  _botonesRedondeados(_),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(37, 37, 57, 1.0)
          ])),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.0),
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0),
            ])),
      ),
    );

    return Stack(
      children: [
        gradiente,
        Positioned(
          child: cajaRosa,
          top: -90.0,
        ),
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Productos',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Registre y consulte acerca de sus productos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _botonesRedondeados(HomeController _) {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.blue, Icons.production_quantity_limits,
                'Crear Producto', _),
            _crearBotonRedondeado(
                Colors.orange, Icons.edit, 'Editar Producto', _),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(
                Colors.purpleAccent, Icons.delete, 'Eliminar Producto', _),
            _crearBotonRedondeado(
                Colors.pinkAccent, Icons.read_more, 'Ver Producto', _),
          ],
        ),
      ],
    );
  }

  Widget _crearBotonRedondeado(
      Color color, IconData icono, String texto, HomeController _) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 0.28,
        sigmaY: 0.28,
      ),
      child: Container(
        height: 180.0,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 5.0,
            ),
            CircleAvatar(
              backgroundColor: color,
              radius: 35.0,
              child: IconButton(
                icon: Icon(icono),
                onPressed: () {
                  _.actionValue(texto);
                  _.irATarea();
                },
                color: Colors.white,
                iconSize: 30.0,
              ),
            ),
            Text(
              texto,
              style: TextStyle(
                color: color,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
