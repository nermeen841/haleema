import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class EmptyItem extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  const EmptyItem(
      {super.key,
      required this.image,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const VerticalSpace(value: 7),
        Center(
          child: Image.asset(image),
        ),
        const VerticalSpace(value: 4),
        Text(
          title,
          style: headingStyle2(context: context, color: colorBlack),
        ),
        const VerticalSpace(value: 1.5),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.04),
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: bodyStryle(context: context, color: colorGrey),
          ),
        ),
      ],
    );
  }
}
