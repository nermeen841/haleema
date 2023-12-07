import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class DetailInfoItem extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback ontap;
  const DetailInfoItem(
      {super.key,
      required this.name,
      required this.image,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: screenWidth(context) * 0.2,
        height: screenHeight(context) * 0.1,
        decoration: BoxDecoration(
          color: colorGreyLight.withOpacity(0.1),
          borderRadius: BorderRadius.circular(
            screenWidth(context) * 0.04,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: screenWidth(context) * 0.08,
              fit: BoxFit.contain,
            ),
            const VerticalSpace(value: 1),
            Text(
              name,
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
