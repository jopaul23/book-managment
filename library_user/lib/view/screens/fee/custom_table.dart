import 'package:flutter/material.dart';
import 'package:library_user/models/fee.dart';

import '../../constants.dart';

class TableCustom extends StatelessWidget {
  const TableCustom({
    Key? key,
    required this.size,
    required this.feeList,
  }) : super(key: key);

  final Size size;
  final List<FeeModel> feeList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (feeList.length + 1) * 60,
      width: size.width - defaultPadding * 2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultPadding),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(defaultPadding),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: (size.width - defaultPadding * 2) / 3,
                      height: 60,
                      color: primaryBlue.withOpacity(0.05),
                      alignment: Alignment.center,
                      child: const Text(
                        "From",
                        style: TextStyle(
                            color: primaryBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      width: (size.width - defaultPadding * 2) / 3,
                      height: 60,
                      alignment: Alignment.center,
                      color: primaryBlue.withOpacity(0.05),
                      child: const Text(
                        "To",
                        style: TextStyle(
                            color: primaryBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      width: (size.width - defaultPadding * 2) / 3,
                      alignment: Alignment.center,
                      height: 60,
                      color: primaryBlue.withOpacity(0.05),
                      child: const Text(
                        "Fee",
                        style: TextStyle(
                            color: primaryBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
                for (int i = 0; i < feeList.length; i++)
                  Row(
                    children: [
                      Container(
                        width: (size.width - defaultPadding * 2) / 3,
                        height: 60,
                        color:
                            i % 2 == 0 ? white : primaryBlue.withOpacity(0.05),
                        alignment: Alignment.center,
                        child: Text(
                          feeList[i].starting,
                          style:
                              const TextStyle(color: textColor1, fontSize: 16),
                        ),
                      ),
                      Container(
                        width: (size.width - defaultPadding * 2) / 3,
                        height: 60,
                        alignment: Alignment.center,
                        color:
                            i % 2 == 0 ? white : primaryBlue.withOpacity(0.05),
                        child: Text(
                          feeList[i].ending,
                          style:
                              const TextStyle(color: textColor1, fontSize: 16),
                        ),
                      ),
                      Container(
                        width: (size.width - defaultPadding * 2) / 3,
                        alignment: Alignment.center,
                        height: 60,
                        color:
                            i % 2 == 0 ? white : primaryBlue.withOpacity(0.05),
                        child: Text(
                          feeList[i].fee.toString(),
                          style:
                              const TextStyle(color: textColor1, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                // for(Fe eModel fee in feeList)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: (feeList.length + 1) * 60,
                  width: 1,
                  color: primaryBlue.withOpacity(0.2),
                ),
                Container(
                  height: (feeList.length + 1) * 60,
                  width: 1,
                  color: primaryBlue.withOpacity(0.2),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
