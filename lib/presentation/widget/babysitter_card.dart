import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class BabbySitterCard extends StatelessWidget {
  final String name;
  final String image;
  final String priceHour;
  final String numOfSesstion;
  final String adderss;
  final double rate;

  const BabbySitterCard(
      {super.key,
      required this.name,
      required this.image,
      required this.priceHour,
      required this.numOfSesstion,
      required this.adderss,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context) * 0.4,
      padding: EdgeInsets.only(
        bottom: screenHeight(context) * 0.04,
      ),
      margin: EdgeInsets.only(
        right: screenWidth(context) * 0.02,
        left: screenWidth(context) * 0.02,
        bottom: screenWidth(context) * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          screenWidth(context) * 0.03,
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
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: screenHeight(context) * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                screenWidth(context) * 0.03,
              ),
              child: customCachedNetworkImage(
                  url: image, context: context, fit: BoxFit.cover),
            ),
          ),
          const VerticalSpace(value: 1),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.015),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: headingStyle3(context: context, color: colorBlack),
                    ),
                    // const HorizontalSpace(value: 0.5),
                    SvgPicture.asset(AppIcons.verifiedIcon),
                  ],
                ),
                const VerticalSpace(value: 1),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar(
                      ignoreGestures: true,
                      allowHalfRating: true,
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
                      initialRating: rate,
                      itemCount: 5,
                      itemSize: screenWidth(context) * 0.03,
                      onRatingUpdate: (double value) {},
                    ),
                    Text(
                      rate.toString(),
                      style: bodyStryle2(context: context, color: colorBlack),
                    ),
                  ],
                ),
                Text(
                  "$priceHour ر.س",
                  style: headingStyle3(
                    context: context,
                    color: kMainColor,
                  ),
                ),
                const VerticalSpace(value: 1),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppIcons.doneIcon),
                    const HorizontalSpace(value: 0.5),
                    Text(
                      "$numOfSesstion جلسة مكتملة",
                      style: bodyStryle2(context: context, color: colorBlack),
                    ),
                  ],
                ),
                const VerticalSpace(value: 1),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppIcons.locationIcon,
                      height: 13,
                      width: 13,
                      fit: BoxFit.scaleDown,
                    ),
                    const HorizontalSpace(value: 0.5),
                    SizedBox(
                      width: screenWidth(context) * 0.27,
                      child: Text(
                        adderss,
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        style: bodyStryle3(context: context, color: colorBlack),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
