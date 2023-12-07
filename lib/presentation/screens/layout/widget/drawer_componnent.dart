import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

//////////////////////////////////////////////////////////////////////////////////
Widget sectiontitle(String title, context) {
  return Container(
    width: double.infinity,
    color: colorGreyLight.withOpacity(0.1),
    padding: EdgeInsets.symmetric(
      horizontal: screenWidth(context) * 0.03,
      vertical: screenWidth(context) * 0.04,
    ),
    child: Text(
      title,
      style: headingStyle2(context: context, color: colorBlack),
    ),
  );
}

////////////////////////////////////////////////////////////////////////////
ListTile drawerItem({
  required String title,
  required String icon,
  required VoidCallback ontap,
  required context,
}) {
  return ListTile(
    onTap: ontap,
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        const HorizontalSpace(value: 1),
        Text(
          title,
          style: bodyStryle2(context: context, color: colorBlack),
        ),
      ],
    ),
    trailing: Icon(
      Icons.arrow_forward_ios,
      color: kMainColor,
    ),
  );
}
