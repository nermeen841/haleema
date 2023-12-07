import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/network/dynamic_link.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/presentation/screens/favourite/cubit/favourite_cubit.dart';
import 'package:share_plus/share_plus.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage(
      {super.key,
      required this.name,
      required this.numOfSesstion,
      required this.image,
      // required this.isFavourite,
      required this.totalRates,
      required this.rateValue,
      required this.setterId});
  final String name;
  final int setterId;

  final String numOfSesstion;
  final String image;
  // final bool isFavourite;
  final String totalRates;
  final double rateValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => DynamicLinkService()
                  .createDynamicLink(
                id: setterId,
                type: "setter",
                title: name,
                image: image,
              )
                  .then((value) {
                Share.share(
                  value.toString(),
                );
              }),
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.circleShareIcon,
                ),
              ),
            ),
            Center(
              child: CircleAvatar(
                radius: screenWidth(context) * 0.15,
                backgroundColor: kMainColor,
                backgroundImage: NetworkImage(image),
              ),
            ),
            BlocConsumer<FavouriteCubit, FavouriteState>(
              bloc: GetIt.I<FavouriteCubit>(),
              listener: (context, state) {},
              builder: (context, state) {
                return InkWell(
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
                );
              },
            ),
          ],
        ),
        const VerticalSpace(value: 1),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                numOfSesstion,
                style: headingStyle1(
                  context: context,
                  color: colorBlack,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: headingStyle3(context: context, color: colorBlack),
                ),
                const HorizontalSpace(value: 0.5),
                SvgPicture.asset(AppIcons.verifiedIcon),
              ],
            ),
            Center(
              child: Text(
                totalRates,
                style: headingStyle1(
                  context: context,
                  color: colorBlack,
                ),
              ),
            ),
          ],
        ),
        const VerticalSpace(value: 1),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                translateString("complete sessions", "جلسه مكتمله"),
                style: bodyStryle(
                  context: context,
                  color: colorGrey,
                ),
              ),
            ),
            Row(
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
                  initialRating: rateValue,
                  itemCount: 5,
                  itemSize: screenWidth(context) * 0.03,
                  onRatingUpdate: (double value) {},
                ),
                Text(
                  rateValue.toString(),
                  style: bodyStryle2(context: context, color: colorBlack),
                ),
              ],
            ),
            Center(
              child: Text(
                translateString("parents ratting", "تقييم من الاباء"),
                style: bodyStryle(
                  context: context,
                  color: colorGrey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
