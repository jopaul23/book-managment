import 'dart:convert';

import 'package:library_admin/models/publisher.dart';
import 'package:http/http.dart' as http;

class PublisherApi {
  static Future<List<PublisherModel>> getPublisher(
      {required String searchString}) async {
    Map<String, dynamic> body = {"search_string": searchString};
    Uri uri =
        Uri.parse("http://159.89.161.168:4050/api/admin/search-publisher");
    try {
      http.Response response =
          await http.post(uri, body: json.encode(body), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      }).timeout(const Duration(seconds: 5));
      print(response.statusCode);
      List<PublisherModel> publisherList = [];
      for (Map<String, dynamic> bookJson in json.decode(response.body)) {
        publisherList.add(PublisherModel.fromMap(bookJson));
      }
      return publisherList;
    } catch (e) {
      print("Error occure $e");
      return [];
    }
  }

  static Future<Map<String, dynamic>> addPublisher(
      {required String publisherName}) async {
    Map<String, dynamic> body = {"name": publisherName};

    Uri uri = Uri.parse("http://159.89.161.168:4050/api/admin/add-publisher");
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
