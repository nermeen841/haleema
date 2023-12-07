import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback ontap;
  const ProfileItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: screenHeight(context) * 0.08,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.02),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(icon),
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
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
