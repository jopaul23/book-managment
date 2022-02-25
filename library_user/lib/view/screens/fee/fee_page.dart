import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_user/controller/fee_controller.dart';
import 'package:library_user/models/fee.dart';
import 'package:library_user/view/constants.dart';
import 'package:library_user/view/screens/fee/custom_table.dart';
import 'package:library_user/view/widgets/bottom_navigation_bar.dart';

class FeePage extends StatefulWidget {
  const FeePage({Key? key}) : super(key: key);

  @override
  _FeePageState createState() => _FeePageState();
}

class _FeePageState extends State<FeePage> {
  FeeController feeController = Get.put(FeeController());
  @override
  Widget build(BuildContext context) {
    feeController.getAllFees();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          leadingWidth: 25,
          title: Row(
            children: [
              Text(
                "Fee Details",
                style: TextStyle(
                  color: primaryBlue,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarCustom(currentIndex: 1),
        body: GetBuilder<FeeController>(builder: (context) {
          List<FeeModel> feeList = feeController.feeList;
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: (feeList.length + 1) * 60,
                    width: size.width - defaultPadding * 2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(defaultPadding),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Colors.black.withOpacity(.1),
                          )
                        ]),
                    child: TableCustom(size: size, feeList: feeList),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
