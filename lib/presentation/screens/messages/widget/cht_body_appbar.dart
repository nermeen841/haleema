import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/text_theme.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/router/router.dart';

AppBar chatbodyAppbar({
  required String title,
  required context,
  required String image,
}) {
  return AppBar(
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(AppIcons.phoneRingingIconPink),
      ),
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(AppIcons.videoRecordIcon),
      ),
    ],
    leading: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => MagicRouter.pop(),
          child: const Center(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        CircleAvatar(
          radius: screenWidth(context) * 0.05,
          backgroundColor: kMainColor,
          backgroundImage: NetworkImage(image),
        ),
      ],
    ),
    elevation: 0,
    centerTitle: false,
    title: Text(
      title,
      style: headingStyle2(context: context, color: colorBlack),
    ),
  );
}
