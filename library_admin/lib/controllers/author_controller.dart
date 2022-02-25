import 'package:get/get.dart';
import 'package:library_admin/api/author_api.dart';
import 'package:library_admin/api/publisher_api.dart';
import 'package:library_admin/models/author.dart';
import 'package:library_admin/models/publisher.dart';

class AuthorController extends GetxController {
  List<AuthorModel> authorList = [];
  getAllAuthor() async {
    authorList = await AuthorApi.getAuthor(searchString: "");
    update();
  }
}
