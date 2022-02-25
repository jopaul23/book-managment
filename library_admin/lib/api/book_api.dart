import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:library_admin/models/book.dart';

class BookApi {
  static Future<List<BookModel>> getBooks(
      {required String searchString}) async {
    Map<String, dynamic> body = {"search_string": searchString};
    Uri uri = Uri.parse("http://159.89.161.168:4050/books/search");
    try {
      http.Response response =
          await http.post(uri, body: json.encode(body), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      }).timeout(const Duration(seconds: 5));
      print(response.statusCode);
      List<BookModel> bookList = [];
      for (Map<String, dynamic> bookJson in json.decode(response.body)) {
        bookList.add(BookModel.fromMap(bookJson));
      }
      return bookList;
    } catch (e) {
      print("Error occure $e");
      return [];
    }
  }

  static Future<Map<String, dynamic>> addBook(
      {required String bookName,
      required int bookCount,
      required int publisherId,
      required int authorId}) async {
    Map<String, dynamic> body = {
      "book_name": bookName,
      "book_count": bookCount,
      "publisher_id": publisherId,
      "author_id": authorId
    };

    Uri uri = Uri.parse("http://159.89.161.168:4050/api/admin/add-book");
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
