import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laza_commerce/Network/model/login_data.dart';
import 'package:laza_commerce/Network/model/register_data.dart';
import 'package:laza_commerce/views/Login.dart';
import 'package:laza_commerce/views/categories.dart';
import 'package:laza_commerce/views/layout_screen.dart';
import 'package:laza_commerce/views/verifecation.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 120),
      receiveTimeout: Duration(seconds: 50),
      responseType: ResponseType.json,
    ));
  }

  Future <void> register({required String name,
    required String email,
    required String password,
    required String number}) async {
    RegisterData model = RegisterData();
    try {
      var response = await dio!.post('register', data: {
        'name': name,
        'password': password,
        'email': email,
        'phone': number
      });
      model = RegisterData.fromJson(response.data);
      if (model.status == true) {
        Get.snackbar(model.message ?? "", "", backgroundColor: Colors.green);
        Get.to(const Login());
      } else {
        Get.snackbar(model.message ?? "", "", backgroundColor: Colors.red);
      }
    } catch (e) {
      if (e is DioException) {
        Get.snackbar("Network Error", "Please check your internet connection.",
            backgroundColor: Colors.red);
      } else {
        print(e);
      }
    }
  }
  Future <void> login({
    required String email,
    required String password,
  }) async {
    LoginData model = LoginData();
    try {
      var response = await dio!.post('login', data: {
        'password': password,
        'email': email,
      });
      model = LoginData.fromJson(response.data);
      if (model.status == true) {
        Get.snackbar(model.message ?? "", "", backgroundColor: Colors.green);
        Get.offAll(const LayoutScreen());
      } else {
        Get.snackbar(model.message ?? "", "", backgroundColor: Colors.red);
      }
    } catch (e) {
      if (e is DioException) {
        Get.snackbar(
            "Network Error", "Please check your internet connection.",
            backgroundColor: Colors.red);
      } else {
        print(e);
      }
    }
  }

}