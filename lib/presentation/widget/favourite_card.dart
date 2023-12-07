import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

import '../screens/favourite/cubit/favourite_cubit.dart';

class FavouriteCard extends StatelessWidget {
  final String name;
  final String image;
  final String hourPrice;
  final String completeOrders;
  final int setterId;

  const FavouriteCard(
      {super.key,
      required this.name,
      required this.image,
      required this.hourPrice,
      required this.completeOrders,
      required this.setterId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.02,
        horizontal: screenHeight(context) * 0.015,
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
      child: Row(
        children: [
          SizedBox(
            width: screenWidth(context) * 0.3,
            height: screenHeight(context) * 0.15,
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
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style:
                            headingStyle3(context: context, color: colorBlack),
                      ),
                      const HorizontalSpace(value: 0.5),
                      SvgPicture.asset(AppIcons.verifiedIcon),
                    ],
                  ),
                  const HorizontalSpace(value: 7.5),
                  InkWell(
                    onTap: () {
                      if (GetIt.I<FavouriteCubit>().isFavourite[setterId] ==
                          true) {
                        GetIt.I<FavouriteCubit>()
                            .removeFavourite(setterId: setterId);
                      } else {
                        GetIt.I<FavouriteCubit>().addFavourite(
                          setterId: setterId,
                        );
                      }
                    },
                    child: Center(
                      child: (GetIt.I<FavouriteCubit>().isFavourite[setterId] ==
                              false)
                          ? Icon(
                              Icons.favorite_outline,
                              color: kMainColor,
                            )
                          : Icon(
                              Icons.favorite,
                              color: kMainColor,
                            ),
                    ),
                  )
                ],
              ),
              const VerticalSpace(value: 1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                        initialRating: 4.4,
                        itemCount: 5,
                        itemSize: screenWidth(context) * 0.03,
                        onRatingUpdate: (double value) {},
                      ),
                      const HorizontalSpace(value: 1),
                      Text(
                        "4.0",
                        style: bodyStryle2(context: context, color: colorBlack),
                      ),
                    ],
                  ),
                  const HorizontalSpace(value: 6),
                  Text(
                    "$hourPrice ر.س",
                    style: headingStyle3(
                      context: context,
                      color: kMainColor,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(value: 1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppIcons.doneIcon),
                  const HorizontalSpace(value: 0.5),
                  Text(
                    "$completeOrders جلسة مكتملة",
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
                    width: screenWidth(context) * 0.47,
                    child: Text(
                      "الدمام شارع الامير محمد علي , بيت رقم 20 ",
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: bodyStryle3(context: context, color: colorBlack),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
