import 'dart:convert';

import 'package:library_user/models/fee.dart';
import 'package:http/http.dart' as http;

class FeeApi {
  static Future<List<FeeModel>> getFee({required String searchString}) async {
    Map<String, dynamic> body = {"search_string": searchString};
    Uri uri = Uri.parse("http://159.89.161.168:4050/fee/get");
    try {
      http.Response response =
          await http.post(uri, body: json.encode(body), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      }).timeout(const Duration(seconds: 5));
      print(response.statusCode);
      List<FeeModel> feeList = [];
      for (Map<String, dynamic> bookJson in json.decode(response.body)) {
        feeList.add(FeeModel.fromMap(bookJson));
      }
      return feeList;
    } catch (e) {
      print("Error occure $e");
      return [];
    }
  }
}
