import 'package:flutter/material.dart';
import 'package:library_admin/view/constants/constants.dart';
import 'package:library_admin/view/widgets/textfield_custom.dart';

class AddBookForm extends StatefulWidget {
  const AddBookForm({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<AddBookForm> createState() => AddBookFormState();
}

class AddBookFormState extends State<AddBookForm> {
  final bookKey = GlobalKey<TextFieldCustomState>();
  final authorKey = GlobalKey<TextFieldCustomState>();
  final publisherKey = GlobalKey<TextFieldCustomState>();
  final bookCountKey = GlobalKey<TextFieldCustomState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: widget.size.width - defaultPadding * 2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultPadding),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ]),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              height: 60,
              width: widget.size.width - defaultPadding * 2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultPadding),
                    topRight: Radius.circular(defaultPadding)),
              ),
              child: TextFieldCustom(
                key: bookKey,
                underline: false,
                isPass: false,
                prefixSvg: "assets/svg/book.svg",
                padding: defaultPadding,
                hintText: "book",
                width: widget.size.width - defaultPadding * 2,
              )),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              height: 60,
              color: const Color(0xffF6F6F6),
              width: widget.size.width - defaultPadding * 2,
              child: TextFieldCustom(
                key: authorKey,
                underline: false,
                isPass: false,
                prefixSvg: "assets/svg/user.svg",
                padding: defaultPadding,
                hintText: "author id",
                width: widget.size.width - defaultPadding * 2,
              )),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              height: 60,
              width: widget.size.width - defaultPadding * 2,
              child: TextFieldCustom(
                key: publisherKey,
                underline: false,
                isPass: false,
                prefixSvg: "assets/svg/publisher.svg",
                padding: defaultPadding,
                hintText: "publisher id",
                width: widget.size.width - defaultPadding * 2,
              )),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              height: 60,
              width: widget.size.width - defaultPadding * 2,
              decoration: const BoxDecoration(
                color: Color(0xffF6F6F6),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(defaultPadding),
                    bottomRight: Radius.circular(defaultPadding)),
              ),
              child: TextFieldCustom(
                isPass: false,
                key: bookCountKey,
                underline: false,
                prefixSvg: "assets/svg/book.svg",
                padding: defaultPadding,
                hintText: "no of books",
                width: widget.size.width - defaultPadding * 2,
              )),
        ],
      ),
    );
  }
}
