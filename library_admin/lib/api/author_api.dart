import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_admin/models/author.dart';

class AuthorApi {
  static Future<List<AuthorModel>> getAuthor(
      {required String searchString}) async {
    Map<String, dynamic> body = {"search_string": searchString};
    Uri uri = Uri.parse("http://159.89.161.168:4050/api/admin/search-author");
    try {
      http.Response response =
          await http.post(uri, body: json.encode(body), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      }).timeout(const Duration(seconds: 5));
      print(response.statusCode);
      List<AuthorModel> publisherList = [];
      for (Map<String, dynamic> authorJson in json.decode(response.body)) {
        publisherList.add(AuthorModel.fromMap(authorJson));
      }
      return publisherList;
    } catch (e) {
      print("Error occure $e");
      return [];
    }
  }

  static Future<Map<String, dynamic>> addAuthor(
      {required String authorName}) async {
    Map<String, dynamic> body = {"name": authorName};

    Uri uri = Uri.parse("http://159.89.161.168:4050/api/admin/add-author");
    try {
      http.Response response =
          await http.post(uri, body: jsonEncode(body), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      }).timeout(const Duration(seconds: 5));

      Map<String, dynamic> map = {
        "status": response.statusCode,
        "message": response.body
      };
      return map;
    } catch (e) {
      print("error occured $e");
      Map<String, dynamic> map = {
        "status": 500,
        "message": "Connection time out"
      };
      return map;
    }
  }
}
