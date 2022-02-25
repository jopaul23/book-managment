import 'package:get/get.dart';
import 'package:library_admin/api/publisher_api.dart';
import 'package:library_admin/view/constants/constants.dart';
import 'package:library_admin/view/screens/publisher/publisher_page.dart';
import 'package:library_admin/view/widgets/toast.dart';

class AddPublisherController extends GetxController {
  String publisherName = "";
  addPublisher() async {
    if (publisherName == "") {
      showToast(
          context: Get.overlayContext!,
          title: "publisher name required",
          description: "",
          icon: "assets/svg/warning.svg",
          color: toastYellow);
    } else {
      Map<String, dynamic> status =
          await PublisherApi.addPublisher(publisherName: publisherName);
      if (status["status"] == 200) {
        showToast(
            context: Get.overlayContext!,
            title: "publisher added successfully",
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
