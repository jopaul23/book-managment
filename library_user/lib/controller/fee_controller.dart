import 'package:get/get.dart';
import 'package:library_user/api/book_api.dart';
import 'package:library_user/api/fee_api.dart';
import 'package:library_user/models/fee.dart';

class FeeController extends GetxController {
  List<FeeModel> feeList = [];
  getAllFees() async {
    feeList = await FeeApi.getFee(searchString: "");
    print("feeList $feeList");
    update();
  }
}
