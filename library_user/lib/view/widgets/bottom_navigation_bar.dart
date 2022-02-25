import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:library_user/view/constants.dart';
import 'package:library_user/view/screens/fee/fee_page.dart';

import '../screens/home/home.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({Key? key, required this.currentIndex})
      : super(key: key);
  final int currentIndex;

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  @override
  Widget build(BuildContext context) {
    List pages = [const Home(), const FeePage()];
    return BottomNavigationBar(
      backgroundColor: white,
      currentIndex: widget.currentIndex,
      onTap: (newIndex) {
        setState(() {
          if (newIndex != widget.currentIndex) {
            Get.to(pages[newIndex]);
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/svg/book.svg",
            height: 30,
            color: widget.currentIndex == 0 ? primaryBlue : textColor1,
          ),
          label: "book",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/svg/publisher.svg",
            height: 28,
            color: widget.currentIndex == 1 ? primaryBlue : textColor1,
          ),
          label: "fee",
        ),
      ],
    );
  }
}
