import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/generator/locale_keys.dart';

List<BottomNavigationBarItem> items({required context, required index}) {
  return [
    BottomNavigationBarItem(
      icon: Container(
        width: screenWidth(context) * 0.2,
        height: screenHeight(context) * 0.061,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            screenWidth(context) * 0.04,
          ),
          color: index == 0 ? kMainColor : Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.homeIcon,
              color: index == 0 ? Colors.white : colorGrey,
            ),
            Text(
              LocaleKeys.HOME.tr(),
              style: bodyStryle3(
                color: index == 0 ? Colors.white : colorGrey,
                context: context,
              ),
            ),
          ],
        ),
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Container(
        width: screenWidth(context) * 0.2,
        height: screenHeight(context) * 0.061,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            screenWidth(context) * 0.04,
          ),
          color: index == 1 ? kMainColor : Colors.transparent,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              AppIcons.ordersIcon,
              color: index == 1 ? Colors.white : null,
            ),
            Text(
              translateString("My orders", "طلباتي"),
              style: bodyStryle3(
                color: index == 1 ? Colors.white : colorGrey,
                context: context,
              ),
            ),
          ],
        ),
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Container(
        width: screenWidth(context) * 0.2,
        height: screenHeight(context) * 0.061,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            screenWidth(context) * 0.04,
          ),
          color: index == 2 ? kMainColor : Colors.transparent,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              AppIcons.messageIcon,
              color: index == 2 ? Colors.white : colorGrey,
            ),
            Text(
              LocaleKeys.MESSAGE.tr(),
              style: bodyStryle3(
                color: index == 2 ? Colors.white : colorGrey,
                context: context,
              ),
            ),
          ],
        ),
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Container(
        width: screenWidth(context) * 0.2,
        height: screenHeight(context) * 0.061,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            screenWidth(context) * 0.04,
          ),
          color: index == 3 ? kMainColor : Colors.transparent,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              AppIcons.userIcon,
              color: index == 3 ? Colors.white : null,
            ),
            Text(
              LocaleKeys.MY_PROFILE.tr(),
              style: bodyStryle3(
                color: index == 3 ? Colors.white : colorGrey,
                context: context,
              ),
            ),
          ],
        ),
      ),
      label: "",
    ),
  ];
}
