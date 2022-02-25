import 'package:get/get.dart';
import 'package:library_admin/api/book_api.dart';
import 'package:library_admin/view/constants/constants.dart';
import 'package:library_admin/view/screens/book/home_page.dart';
import 'package:library_admin/view/widgets/toast.dart';

class BookAddController extends GetxController {
  String bookName = "";
  String authorId = "";
  String publisherId = "";
  String bookCount = "";

  addBook() async {
    if (bookName == "" ||
        authorId == "" ||
        publisherId == "" ||
        bookCount == "") {
      showToast(
          context: Get.overlayContext!,
          title: "All fields are required",
          description: "",
          icon: "assets/svg/warning.svg",
          color: toastYellow);
    } else {
      Map<String, dynamic> status = await BookApi.addBook(
          bookName: bookName,
          bookCount: int.parse(bookCount),
          publisherId: int.parse(publisherId),
          authorId: int.parse(authorId));

      showToast(
        context: Get.overlayContext!,
        title: status["message"],
        description: "",
        icon: status["status"] == 200
            ? "assets/svg/tick.svg"
            : "assets/svg/warning.svg",
        color: status["status"] == 200 ? primaryBlue : toastYellow,
      );
      if (status["status"] == 200) {
        Get.off(Home());
      }
    }
  }
}
