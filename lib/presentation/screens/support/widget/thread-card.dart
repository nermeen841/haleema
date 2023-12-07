import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class ThreadCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final Color? borderColor;
  const ThreadCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.date,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.02,
        vertical: screenHeight(context) * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth(context) * 0.015),
        border: Border.all(
          color: borderColor ?? textBorderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title),
          const VerticalSpace(value: 1),
          Text(subtitle),
          const VerticalSpace(value: 1),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              date,
              style: bodyStryle2(context: context, color: colorGrey),
            ),
          ),
        ],
      ),
    );
  }
}
