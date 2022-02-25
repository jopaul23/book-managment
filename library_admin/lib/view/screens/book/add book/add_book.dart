import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:library_admin/controllers/book_add_controller.dart';
import 'package:library_admin/view/constants/constants.dart';
import 'package:library_admin/view/screens/book/add%20book/add_book_form.dart';
import 'package:library_admin/view/widgets/buttons/primary_rounded_rect.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({Key? key}) : super(key: key);

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  BookAddController bookAddController = Get.put(BookAddController());
  final bookFormKey = GlobalKey<AddBookFormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - defaultPadding * 3,
          padding: const EdgeInsets.all(defaultPadding),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg/library.svg",
                height: MediaQuery.of(context).size.height * 2 / 5,
              ),
              AddBookForm(
                size: MediaQuery.of(context).size,
                key: bookFormKey,
              ),
              PrimaryButton(
                  onpressed: () {
                    bookAddController.bookCount = bookFormKey.currentState!
                        .bookCountKey.currentState!.myController.text;
                    bookAddController.authorId = bookFormKey.currentState!
                        .authorKey.currentState!.myController.text;
                    bookAddController.publisherId = bookFormKey.currentState!
                        .publisherKey.currentState!.myController.text;
                    bookAddController.bookName = bookFormKey
                        .currentState!.bookKey.currentState!.myController.text;
                    bookAddController.addBook();
                    print("pressed");
                  },
                  text: "Add Book")
            ],
          ),
        ),
      ),
    ));
  }
}
