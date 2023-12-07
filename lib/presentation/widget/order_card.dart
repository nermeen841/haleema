import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class OrderCardItem extends StatelessWidget {
  final String orderStatuse;
  final String name;
  final String image;
  final String rate;
  final String childCount;
  final String days;
  final String hours;
  final String date;
  final String time;
  final String hourPrice;
  final Color orderColor;
  const OrderCardItem(
      {super.key,
      required this.orderStatuse,
      required this.orderColor,
      required this.name,
      required this.image,
      required this.rate,
      required this.childCount,
      required this.days,
      required this.hours,
      required this.date,
      required this.time,
      required this.hourPrice});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) * 0.23,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: double.infinity,
            height: screenHeight(context) * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                screenWidth(context) * 0.05,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(0, 2),
                  spreadRadius: 2,
                  blurRadius: 2,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              vertical: screenHeight(context) * 0.02,
              horizontal: screenWidth(context) * 0.02,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: screenWidth(context) * 0.35,
                  height: screenHeight(context) * 0.23,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      screenWidth(context) * 0.03,
                    ),
                    child: customCachedNetworkImage(
                        url: image, context: context, fit: BoxFit.cover),
                  ),
                ),
                const HorizontalSpace(value: 1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: headingStyle3(
                              context: context, color: colorBlack),
                        ),
                        const HorizontalSpace(value: 0.5),
                        SvgPicture.asset(AppIcons.verifiedIcon),
                      ],
                    ),
                    const VerticalSpace(value: 1),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBar(
                          ignoreGestures: true,
                          ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            half: const Icon(
                              Icons.star_half,
                              color: Colors.amber,
                            ),
                            empty: const Icon(
                              Icons.star_outline,
                              color: Colors.amber,
                            ),
                          ),
                          initialRating: double.parse(rate),
                          itemCount: 5,
                          itemSize: screenWidth(context) * 0.03,
                          onRatingUpdate: (double value) {},
                        ),
                        const HorizontalSpace(value: 1),
                        Text(
                          rate,
                          style:
                              bodyStryle2(context: context, color: colorBlack),
                        ),
                      ],
                    ),
                    const VerticalSpace(value: 1),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppIcons.babyBoyIcon),
                        const HorizontalSpace(value: 0.7),
                        Text(
                          childCount,
                          style:
                              bodyStryle(context: context, color: colorBlack),
                        ),
                        const HorizontalSpace(value: 1),
                        SvgPicture.asset(AppIcons.timerIcon),
                        const HorizontalSpace(value: 0.7),
                        Text(
                          translateString("($days days - $hours hours)",
                              "($days ايام - $hours ساعات)"),
                          style:
                              bodyStryle(context: context, color: colorBlack),
                        ),
                      ],
                    ),
                    const VerticalSpace(value: 1),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppIcons.calendarIcon),
                        const HorizontalSpace(value: 0.7),
                        Text(
                          date,
                          style:
                              bodyStryle(context: context, color: colorBlack),
                        ),
                        const HorizontalSpace(value: 1),
                        SvgPicture.asset(AppIcons.clockIcon),
                        const HorizontalSpace(value: 0.7),
                        Text(
                          time,
                          style:
                              bodyStryle(context: context, color: colorBlack),
                        ),
                      ],
                    ),
                    const VerticalSpace(value: 1),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppIcons.walletIcon),
                        const HorizontalSpace(value: 1),
                        Text(
                          "$hourPrice ر.س",
                          style: headingStyle3(
                            context: context,
                            color: kMainColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth(context) * 0.25,
            height: screenHeight(context) * 0.07,
            decoration: BoxDecoration(
              color: orderColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  screenWidth(context) * 0.05,
                ),
                bottomRight: Radius.circular(
                  screenWidth(context) * 0.05,
                ),
              ),
            ),
            child: Center(
              child: Text(
                orderStatuse,
                style: bodyStryle(
                  context: context,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
