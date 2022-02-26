import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_user/controller/book_controller.dart';
import 'package:library_user/controller/fee_controller.dart';
import 'package:library_user/models/book.dart';
import 'package:library_user/models/fee.dart';
import 'package:library_user/view/constants.dart';
import 'package:library_user/view/screens/fee/fee_overlay.dart';
import 'package:library_user/view/screens/home/book_container.dart';
import 'package:library_user/view/widgets/bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BookController bookController = Get.put(BookController());
  FeeController feeController = Get.put(FeeController());
  @override
  Widget build(BuildContext context) {
    feeController.getAllFees();
    bookController.getAllBooks();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          leadingWidth: 25,
          title: Row(
            children: [
              Text(
                "Books",
                style: TextStyle(
                  color: primaryBlue,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  late OverlayEntry feeOverlay;
                  feeOverlay = OverlayEntry(
                      builder: (context) => FeeOverlay(
                          overlay: feeOverlay,
                          feeList: feeController.feeList,
                          size: MediaQuery.of(context).size));
                  Overlay.of(context)?.insert(feeOverlay);
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://png.pngtree.com/element_our/20190529/ourlarge/pngtree-round-cartoon-gold-coin-image_1194649.jpg"),
                ),
              )
            ],
          ),
        ),
        // bottomNavigationBar: const BottomNavigationBarCustom(currentIndex: 0),
        body: GetBuilder<BookController>(builder: (context) {
          List<BookModel> bookList = bookController.bookList;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (BookModel book in bookList) BookContainer(book: book)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
