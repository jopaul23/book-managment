import 'package:get/get.dart';
import 'package:library_user/api/book_api.dart';
import 'package:library_user/models/book.dart';

class BookController extends GetxController {
  List<BookModel> bookList = [];
  getAllBooks() async {
    bookList = await BookApi.getBooks(searchString: "");
    print("bookList $bookList");
    update();
  }
}
