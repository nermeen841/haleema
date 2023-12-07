import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haleema/core/constants/colors.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/core/constants/text_theme.dart';
import 'package:haleema/core/widgets/space_widget.dart';

class AddItem extends StatelessWidget {
  final VoidCallback ontap;
  final String title;
  final String? icon;
  const AddItem(
      {super.key, required this.ontap, required this.title, this.icon});

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
            SvgPicture.asset(icon ?? "assets/icons/add-circle.svg"),
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
