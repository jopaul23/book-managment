import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:library_admin/view/constants/constants.dart';
import 'package:library_admin/view/screens/author/author_page.dart';
import 'package:library_admin/view/screens/book/home_page.dart';
import 'package:library_admin/view/screens/publisher/publisher_page.dart';

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
    List pages = [const Home(), const PublisherPage(), const AuthorPage()];
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
          label: "publisher",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/svg/user.svg",
            height: 28,
            color: widget.currentIndex == 2 ? primaryBlue : textColor1,
          ),
          label: "author",
        ),
      ],
    );
  }
}
