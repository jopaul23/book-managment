import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:library_user/models/book.dart';
import 'package:library_user/view/constants.dart';

class BookContainer extends StatelessWidget {
  const BookContainer({Key? key, required this.book}) : super(key: key);
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: textColor1.withOpacity(.1),
              blurRadius: 20,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/book_color.svg",
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                child: Text(
                  book.bookName,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                book.authorName,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                book.publisherName,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                  "${book.bookCount} ${book.bookCount <= 1 ? "book" : "books"} available",
                  style: TextStyle(
                    fontSize: 14.sp,
                  )),
              const SizedBox(
                height: 5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
