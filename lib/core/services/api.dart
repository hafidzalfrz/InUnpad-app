// import 'package:inunpad/core/models/user.dart';
import 'package:inunpad/core/result.dart';
import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Api {
  static String baseUrlDev = 'http://10.0.2.2:8000';
  // AuthService _auth = locator<AuthService>();
  static BaseOptions _baseOptions = BaseOptions(
    baseUrl: baseUrlDev,
    contentType: 'application/json',
    receiveTimeout: 5,
  );
  Dio dio = Dio(_baseOptions);

  Map<String, String> headers = {"Content-Type": "application/json"};

  Future login(String name, String password) async {
    var data = jsonEncode({
      "name": name,
      "password": password,
    });
    try {
      Response response = await dio.post(
        '/api/login',
        data: data,
      );
      print(response.data);
      // User user = User.fromJson(response.data['data']);
      // _auth.freshLogin(user);
      // _auth.updateCookie(response.headers);
      print(response.statusCode);
      return Result(ResultType.Success, 'Login berhasil');
    } catch (e) {
      print('$e');
      return Result(ResultType.Error, 'Username atau password salah');
    }
  }

  Future register(String name, String password, String email,
      String confirmPassword) async {
    var data = jsonEncode({
      "email": email,
      "name": name,
      "password": password,
      "password_confirmation": confirmPassword,
    });

    try {
      Response response = await dio.post(
        '/api/register',
        data: data,
      );
      print(response.data);
      // User user = User.fromJson(response.data['data']);
      // _auth.freshLogin(user);
      // _auth.updateCookie(response.headers);
      // print(_auth.sessionId);
      print(response.statusCode);
      return Result(ResultType.Success, 'SignUp berhasil');
    } catch (e) {
      print('$e');
      return Result(ResultType.Error, 'SignUp Gagal');
    }
  }
}
