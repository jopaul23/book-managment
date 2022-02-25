import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:library_admin/controllers/author_controller.dart';
import 'package:library_admin/models/author.dart';
import 'package:library_admin/view/constants/constants.dart';
import 'package:library_admin/view/screens/author/add%20author/author_add_page.dart';
import 'package:library_admin/view/widgets/bottom_navigation_bar.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({Key? key}) : super(key: key);

  @override
  _AuthorPageState createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  AuthorController authorController = Get.put(AuthorController());

  @override
  Widget build(BuildContext context) {
    authorController.getAllAuthor();
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
              "Author",
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
      bottomNavigationBar: const BottomNavigationBarCustom(currentIndex: 2),
      floatingActionButton: GestureDetector(
        onTap: () => Get.to(const AddAuthorPage()),
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
            "Add Author",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: white,
            ),
          ),
        ),
      ),
      body: GetBuilder<AuthorController>(builder: (context) {
        List<AuthorModel> authorList = authorController.authorList;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/svg/publisher_color.svg",
                height: size.height - 600,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 370,
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: [
                    for (AuthorModel author in authorList)
                      Container(
                          // height: 70,
                          // width: 70,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: textColor1.withOpacity(.1),
                                  blurRadius: 20,
                                )
                              ]),
                          alignment: Alignment.center,
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  author.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: primaryBlue,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  author.id.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ))
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    ));
  }
}
