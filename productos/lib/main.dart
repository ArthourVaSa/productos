import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productos/app/modules/home/home_binding.dart';
import 'package:productos/app/modules/home/home_page.dart';
import 'package:productos/app/modules/login/login_binding.dart';
import 'package:productos/app/modules/login/login_page.dart';
import 'package:productos/app/routes/app_page.dart';
import 'package:productos/app/utils/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Derteanito',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
      initialBinding: HomeBinding(),
      getPages: AppPage.page,
    );
  }
}
