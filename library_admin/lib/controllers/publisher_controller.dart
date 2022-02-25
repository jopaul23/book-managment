import 'package:get/get.dart';
import 'package:library_admin/api/publisher_api.dart';
import 'package:library_admin/models/publisher.dart';

class PublisherController extends GetxController {
  List<PublisherModel> publisherList = [];
  getAllPublisher() async {
    publisherList = await PublisherApi.getPublisher(searchString: "");
    update();
  }
}
