import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_admin/view/constants/constants.dart';
import 'package:library_admin/view/widgets/textfield_custom.dart';

class PublisherForm extends StatefulWidget {
  const PublisherForm({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<PublisherForm> createState() => PublisherFormState();
}

class PublisherFormState extends State<PublisherForm> {
  final nameKey = GlobalKey<TextFieldCustomState>();
  // final  = GlobalKey<TextFieldCustomState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: widget.size.width - defaultPadding * 2,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultPadding),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ]),
      child: TextFieldCustom(
        key: nameKey,
        underline: false,
        isPass: false,
        prefixSvg: "assets/svg/publisher.svg",
        padding: defaultPadding,
        hintText: "publisher name",
        width: widget.size.width - defaultPadding * 2,
      ),
    );
  }
}
