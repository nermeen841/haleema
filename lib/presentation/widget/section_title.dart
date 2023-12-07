import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  final String searchtitle;
  final int type;
  final void Function()? onPressed;

  const SectionTitleWidget(
      {super.key,
      required this.title,
      required this.searchtitle,
      required this.type,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.02,
        horizontal: screenWidth(context) * 0.03,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: headingStyle2(color: colorBlack, context: context),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              translateString("See All", "شاهد المزيد"),
              style: headingStyle2(color: kMainColor, context: context),
            ),
          )
        ],
      ),
    );
  }
}
/** */