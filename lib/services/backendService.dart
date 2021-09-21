import 'package:flutter/cupertino.dart';

import 'auth.service.dart';
import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
  baseUrl: "https://sheet.hyremaster.com/",
);

class BackendService {
  Dio dio = new Dio(options);

  AuthService auth = new AuthService();

  Future<bool> registerFcm(String token) async {
    try {
      Response response = await dio.post("/user/token", data: {"token": token});
      print(response.data);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> sample(String token) async {
    try {
      Response response = await dio.post("/user/token", data: {"token": token});
      print(response.data);
      return true;
    } catch (err) {
      return false;
    }
  }
}
