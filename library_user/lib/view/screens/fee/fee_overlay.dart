import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user/controller/fee_controller.dart';
import 'package:library_user/models/fee.dart';
import 'package:library_user/view/screens/fee/custom_table.dart';

class FeeOverlay extends StatefulWidget {
  const FeeOverlay(
      {Key? key,
      required this.overlay,
      required this.size,
      required this.feeList})
      : super(key: key);
  final OverlayEntry overlay;
  final Size size;
  final List<FeeModel> feeList;
  @override
  _FeeOverlayState createState() => _FeeOverlayState();
}

class _FeeOverlayState extends State<FeeOverlay> {
  FeeController feeController = Get.put(FeeController());
  @override
  Widget build(BuildContext context) {
    feeController.getAllFees();
    return Positioned(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Material(
        color: Colors.black.withOpacity(.1),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                widget.overlay.remove();
              },
              child: Container(
                color: Colors.black.withOpacity(.4),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
              ),
            ),
            Center(
                child: TableCustom(
              feeList: widget.feeList,
              size: widget.size,
            )),
          ],
        ),
      ),
    );
  }
}
