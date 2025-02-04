import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.crossAxisAlignment, this.mainAxisAlignment});
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.end,
      children: const [
        Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
          size: 30,
        ),
        SizedBox(
          width: 6.3,
        ),
        Text(
          '4.8',
          style: Styles.fontStyle16,
        ),
        SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            '(2450)',
            style: Styles.fontStyle14,
          ),
        ),
      ],
    );
  }
}
