import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class AddChildItem extends StatelessWidget {
  final VoidCallback ontap;
  final String title;
  const AddChildItem({super.key, required this.ontap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.03),
        height: screenHeight(context) * 0.08,
        decoration: BoxDecoration(
          color: textFormFieldColor,
          borderRadius: BorderRadius.circular(screenWidth(context) * 0.03),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(AppIcons.addCircleIcon),
            const HorizontalSpace(value: 1),
            Text(
              title,
              style: bodyStryle(
                context: context,
                color: colorBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
