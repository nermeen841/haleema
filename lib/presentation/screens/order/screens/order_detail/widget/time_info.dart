import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/widgets/space_widget.dart';

import '../../../../../../core/constants/text_theme.dart';

class DateTimeInfoOrder extends StatelessWidget {
  final String date;
  final String time;
  final String hours;
  final String days;
  const DateTimeInfoOrder(
      {super.key,
      required this.date,
      required this.time,
      required this.hours,
      required this.days});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: screenWidth(context) * 0.4,
              height: screenHeight(context) * 0.1,
              decoration: BoxDecoration(
                color: textFormFieldColor,
                borderRadius: BorderRadius.circular(
                  screenWidth(context) * 0.02,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.calendarIcon),
                      const HorizontalSpace(value: 0.7),
                      Text(
                        translateString("booking date", "تاريخ الحجز"),
                        style: bodyStryle(
                          context: context,
                          color: colorGrey,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace(value: 1),
                  Text(
                    date,
                    style: bodyStryle(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth(context) * 0.4,
              height: screenHeight(context) * 0.1,
              decoration: BoxDecoration(
                color: textFormFieldColor,
                borderRadius: BorderRadius.circular(
                  screenWidth(context) * 0.02,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.clockIcon),
                      const HorizontalSpace(value: 0.7),
                      Text(
                        translateString("reservation time", "وقت الحجز"),
                        style: bodyStryle(
                          context: context,
                          color: colorGrey,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace(value: 1),
                  Text(
                    time,
                    style: bodyStryle(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const VerticalSpace(value: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: screenWidth(context) * 0.4,
              height: screenHeight(context) * 0.1,
              decoration: BoxDecoration(
                color: textFormFieldColor,
                borderRadius: BorderRadius.circular(
                  screenWidth(context) * 0.02,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.timerIcon),
                      const HorizontalSpace(value: 0.7),
                      Text(
                        translateString("The number of days", "عدد الأيام"),
                        style: bodyStryle(
                          context: context,
                          color: colorGrey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    translateString("$days Days", "$days أيام"),
                    style: bodyStryle(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth(context) * 0.4,
              height: screenHeight(context) * 0.1,
              decoration: BoxDecoration(
                color: textFormFieldColor,
                borderRadius: BorderRadius.circular(
                  screenWidth(context) * 0.02,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.timerIcon),
                      const HorizontalSpace(value: 0.7),
                      Text(
                        translateString("The number of hours", "عدد الساعات"),
                        style: bodyStryle(
                          context: context,
                          color: colorGrey,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace(value: 1),
                  Text(
                    translateString("$hours Hours", "$hours ساعات"),
                    style: bodyStryle(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
