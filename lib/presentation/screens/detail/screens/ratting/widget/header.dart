import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';

class HeaderImageData extends StatelessWidget {
  HeaderImageData({super.key});

  TextEditingController comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetterCubit, SetterState>(
      listener: (context, state) {},
      bloc: GetIt.I<SetterCubit>(),
      builder: (context, state) {
        return Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: screenWidth(context) * 0.15,
                backgroundColor: kMainColor,
                backgroundImage: NetworkImage(GetIt.I<SetterCubit>()
                    .getSetterDetailModel!
                    .setter!
                    .user!
                    .imageUrl!),
              ),
            ),
            const VerticalSpace(value: 1),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => rattingDialog(
                      context,
                      comment,
                      GetIt.I<SetterCubit>()
                          .getSetterDetailModel!
                          .setter!
                          .user!
                          .id!),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: kMainColor,
                        radius: screenWidth(context) * 0.05,
                        child: Center(
                          child: SvgPicture.asset(
                            AppIcons.starIcon,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const VerticalSpace(value: 1),
                      Center(
                        child: Text(
                          translateString("Add rate", "أضف تقييم"),
                          style: bodyStryle(
                            context: context,
                            color: kMainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight(context) * 0.08,
                  child: VerticalDivider(
                    color: colorGrey.withOpacity(0.3),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          GetIt.I<SetterCubit>()
                              .getSetterDetailModel!
                              .setter!
                              .user!
                              .name!,
                          style: headingStyle3(
                              context: context, color: colorBlack),
                        ),
                        const HorizontalSpace(value: 0.5),
                        SvgPicture.asset(AppIcons.verifiedIcon),
                      ],
                    ),
                    const VerticalSpace(value: 1),
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
                          initialRating: (GetIt.I<SetterCubit>()
                                      .getSetterDetailModel!
                                      .setter!
                                      .user!
                                      .avgNumOfStars !=
                                  null)
                              ? double.parse(GetIt.I<SetterCubit>()
                                  .getSetterDetailModel!
                                  .setter!
                                  .user!
                                  .avgNumOfStars
                                  .toString())
                              : 0.0,
                          itemCount: 5,
                          itemSize: screenWidth(context) * 0.03,
                          onRatingUpdate: (double value) {},
                        ),
                        Text(
                          (GetIt.I<SetterCubit>()
                                      .getSetterDetailModel!
                                      .setter!
                                      .user!
                                      .avgNumOfStars !=
                                  null)
                              ? GetIt.I<SetterCubit>()
                                  .getSetterDetailModel!
                                  .setter!
                                  .user!
                                  .avgNumOfStars
                                  .toString()
                              : "",
                          style:
                              bodyStryle2(context: context, color: colorBlack),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight(context) * 0.08,
                  child: VerticalDivider(
                    color: colorGrey.withOpacity(0.3),
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: Text(
                        GetIt.I<SetterCubit>()
                            .getSetterDetailModel!
                            .setter!
                            .user!
                            .totalRates
                            .toString(),
                        style: headingStyle1(
                          context: context,
                          color: colorBlack,
                        ),
                      ),
                    ),
                    const VerticalSpace(value: 1),
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
            ),
          ],
        );
      },
    );
  }
}
