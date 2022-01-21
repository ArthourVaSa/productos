import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:productos/app/utils/constants.dart';

class DependencyInjection {
  static void init() {
    // ignore: deprecated_member_use
    Get.put<FirebaseDatabase>(FirebaseDatabase());
    Get.put<Dio>(Dio(BaseOptions(baseUrl: Constants.FIREBASE_DATABASE_URL)));
  }
}
