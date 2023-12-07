import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/detail/detail.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';

class BbbySitterInfo extends StatelessWidget {
  final String name;
  final String image;
  final int id;
  final raet;
  const BbbySitterInfo(
      {super.key,
      required this.name,
      required this.image,
      required this.raet,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => GetIt.I<SetterCubit>().getSetterDetail(id).then(
                (value) => MagicRouter.navigateTo(
                  const DetailScreen(),
                ),
              ),
          child: CircleAvatar(
            radius: screenWidth(context) * 0.15,
            backgroundColor: kMainColor,
            backgroundImage: NetworkImage(image),
          ),
        ),
        const VerticalSpace(value: 0.7),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: headingStyle3(context: context, color: colorBlack),
            ),
            const HorizontalSpace(value: 0.5),
            SvgPicture.asset(AppIcons.verifiedIcon),
          ],
        ),
        const VerticalSpace(value: 1),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
              initialRating: double.parse(raet.toString()),
              itemCount: 5,
              itemSize: screenWidth(context) * 0.03,
              onRatingUpdate: (double value) {},
            ),
            const HorizontalSpace(value: 0.7),
            Text(
              raet.toString(),
              style: bodyStryle2(context: context, color: colorBlack),
            ),
          ],
        ),
      ],
    );
  }
}
