import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:library_admin/controllers/book_controller.dart';
import 'package:library_admin/models/book.dart';
import 'package:library_admin/view/constants/constants.dart';
import 'package:library_admin/view/screens/book/add%20book/add_book.dart';
import 'package:library_admin/view/screens/book/book_container.dart';
import 'package:library_admin/view/screens/login/login_page.dart';
import 'package:library_admin/view/widgets/bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BookController bookController = Get.put(BookController());
  @override
  Widget build(BuildContext context) {
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
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.clear();
                  Get.off(const SigninPage());
                },
                child: Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: red,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Log Out",
                    style: TextStyle(color: white, fontSize: 14),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () => Get.to(const AddBookPage()),
          child: Container(
            width: 120,
            height: 50,
            // padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: primaryBlue,
            ),
            child: const Text(
              "Add Book",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: white,
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarCustom(currentIndex: 0),
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
