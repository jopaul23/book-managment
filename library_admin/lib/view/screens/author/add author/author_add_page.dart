import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:library_admin/controllers/author_add_controller.dart';
import 'package:library_admin/controllers/publisher_add_controller.dart';
import 'package:library_admin/view/constants/constants.dart';
import 'package:library_admin/view/screens/author/add%20author/author_form.dart';
import 'package:library_admin/view/screens/publisher/add%20publisher/publisher_form.dart';
import 'package:library_admin/view/widgets/buttons/primary_rounded_rect.dart';

class AddAuthorPage extends StatefulWidget {
  const AddAuthorPage({Key? key}) : super(key: key);

  @override
  _AddAuthorPageState createState() => _AddAuthorPageState();
}

class _AddAuthorPageState extends State<AddAuthorPage> {
  @override
  AddAutthorController addAutthorController = Get.put(AddAutthorController());
  final formKey = GlobalKey<AuthorFormState>();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            height: size.height - defaultPadding * 2,
            width: size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    "assets/svg/author_color2.svg",
                    width: size.width - defaultPadding * 2,
                  ),
                  SizedBox(
                    child: Column(
                      children: const [
                        Text(
                          "Add Author",
                          style: TextStyle(
                            fontSize: 19,
                            color: textColor1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "all fields are required",
                          style: TextStyle(
                            fontSize: 10,
                            color: textColor1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AuthorForm(
                    key: formKey,
                    size: size,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PrimaryButton(
                      onpressed: () {
                        addAutthorController.authorName = formKey.currentState!
                            .nameKey.currentState!.myController.text;
                        addAutthorController.addAuthor();
                      },
                      text: "Add Author"),
                ]),
          ),
        ),
      ),
    );
  }
}
