import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

class RegisterApi {
  static Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    Map body = {
      "email": email,
      "password": password,
    };
    Map<String, dynamic> map = {
      "status": 500,
      "message": "Connection time out"
    };
    Uri uri = Uri.parse("http://159.89.161.168:4050/api/admin/login");
    try {
      http.Response response =
          await http.post(uri, body: json.encode(body), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      }).timeout(const Duration(seconds: 5));
      map = {"status": response.statusCode, "message": response.body};
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      return map;
    } catch (e) {
      debugPrint("error $e");
      return map;
    }
  }
}
