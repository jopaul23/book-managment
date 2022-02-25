import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:library_admin/controllers/publisher_controller.dart';
import 'package:library_admin/models/publisher.dart';
import 'package:library_admin/view/constants/constants.dart';
import 'package:library_admin/view/screens/book/add%20book/add_book.dart';
import 'package:library_admin/view/screens/publisher/add%20publisher/add_publisher_page.dart';
import 'package:library_admin/view/widgets/bottom_navigation_bar.dart';

class PublisherPage extends StatefulWidget {
  const PublisherPage({Key? key}) : super(key: key);

  @override
  _PublisherPageState createState() => _PublisherPageState();
}

class _PublisherPageState extends State<PublisherPage> {
  PublisherController publisherController = Get.put(PublisherController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    publisherController.getAllPublisher();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          leadingWidth: 25,
          title: Row(
            children: [
              Text(
                "Publisher",
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
        floatingActionButton: GestureDetector(
          onTap: () => Get.to(const AddPublisherPage()),
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
              "Add Publisher",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: white,
              ),
            ),
          ),
        ),
        body: GetBuilder<PublisherController>(builder: (context) {
          List<PublisherModel> publisherList =
              publisherController.publisherList;
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
                      for (PublisherModel publisher in publisherList)
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
                                    publisher.name,
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
                                    publisher.id.toString(),
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
      ),
    );
  }
}
