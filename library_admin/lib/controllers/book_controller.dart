import 'package:get/get.dart';
import 'package:library_admin/api/book_api.dart';
import 'package:library_admin/models/book.dart';

class BookController extends GetxController {
  List<BookModel> bookList = [];
  getAllBooks() async {
    bookList = await BookApi.getBooks(searchString: "");
    print("bookList $bookList");
    update();
  }
}
