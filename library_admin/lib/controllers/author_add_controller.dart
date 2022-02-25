import 'package:get/get.dart';
import 'package:library_admin/api/author_api.dart';
import 'package:library_admin/api/publisher_api.dart';
import 'package:library_admin/view/constants/constants.dart';
import 'package:library_admin/view/screens/publisher/publisher_page.dart';
import 'package:library_admin/view/widgets/toast.dart';

class AddAutthorController extends GetxController {
  String authorName = "";
  addAuthor() async {
    if (authorName == "") {
      showToast(
          context: Get.overlayContext!,
          title: "authors name required",
          description: "",
          icon: "assets/svg/warning.svg",
          color: toastYellow);
    } else {
      Map<String, dynamic> status =
          await AuthorApi.addAuthor(authorName: authorName);
      if (status["status"] == 200) {
        showToast(
            context: Get.overlayContext!,
            title: "author added successfully",
            description: "",
            icon: "assets/svg/tick.svg",
            color: primaryBlue);
        Get.off(const PublisherPage());
      } else {
        showToast(
            context: Get.overlayContext!,
            title: status["message"],
            description: "",
            icon: "assets/svg/warning.svg",
            color: toastYellow);
      }
    }
  }
}
