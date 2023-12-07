import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:halema/presentation/screens/profile/widget/body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: GetIt.I<AuthCubit>(),
      listener: (context, state) {},
      builder: (context, state) {
        return (GetIt.I<AuthCubit>().profileModel != null)
            ? Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Scaffold(
                    appBar: customAppbar(title: "", context: context),
                    body: const ProfileBody(),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: screenHeight(context) * 0.17,
                        width: screenWidth(context) * 0.4,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Center(
                              child: CircleAvatar(
                                  radius: screenWidth(context) * 0.15,
                                  backgroundColor: kMainColor,
                                  backgroundImage: NetworkImage(
                                      GetIt.I<AuthCubit>()
                                          .profileModel!
                                          .user!
                                          .imageUrl!)),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: InkWell(
                            //     onTap: () {},
                            //     child: CircleAvatar(
                            //       radius: screenWidth(context) * 0.05,
                            //       backgroundColor: kMainColor,
                            //       child: const Center(
                            //         child: Icon(
                            //           Icons.camera_alt,
                            //           color: Colors.white,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      const VerticalSpace(value: 0.7),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            GetIt.I<AuthCubit>().profileModel!.user!.name!,
                            style: headingStyle3(
                                context: context, color: colorBlack),
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
                          Text(
                            GetIt.I<AuthCubit>()
                                .profileModel!
                                .user!
                                .avgNumOfStars
                                .toString(),
                            style: bodyStryle2(
                                context: context, color: colorBlack),
                          ),
                          const HorizontalSpace(value: 0.5),
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
                            initialRating: (GetIt.I<AuthCubit>()
                                        .profileModel!
                                        .user!
                                        .avgNumOfStars !=
                                    null)
                                ? double.parse(GetIt.I<AuthCubit>()
                                    .profileModel!
                                    .user!
                                    .avgNumOfStars
                                    .toString())
                                : 0.0,
                            itemCount: 5,
                            itemSize: screenWidth(context) * 0.03,
                            onRatingUpdate: (double value) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            : loading();
      },
    );
  }
}
