import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/order/cubit/orders_cubit.dart';

class InfoBody extends StatelessWidget {
  final bool showSocial;
  InfoBody({super.key, required this.showSocial});

  List<String> socialIcons = [
    AppIcons.whatsappIcon,
    AppIcons.snapchatIcon,
    AppIcons.twitterIcon,
    AppIcons.instagramIcon,
    AppIcons.facebookIcon,
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {},
      bloc: GetIt.I<OrdersCubit>(),
      builder: (context, state) {
        return (GetIt.I<OrdersCubit>().setting.isNotEmpty)
            ? SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight(context) * 0.04,
                  horizontal: screenWidth(context) * 0.06,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        (showSocial)
                            ? Text(
                                translateString(
                                    GetIt.I<OrdersCubit>().setting[0].aboutEn!,
                                    GetIt.I<OrdersCubit>().setting[0].aboutAr!),
                                style: bodyStryle(
                                        context: context, color: colorBlack)
                                    .copyWith(
                                  height: 1.7,
                                ),
                              )
                            : Text(
                                translateString(
                                    GetIt.I<OrdersCubit>().setting[0].policyEn!,
                                    GetIt.I<OrdersCubit>()
                                        .setting[0]
                                        .policyAr!),
                                style: bodyStryle(
                                        context: context, color: colorBlack)
                                    .copyWith(
                                  height: 1.7,
                                ),
                              ),
                      ],
                    ),
                    (showSocial)
                        ? Column(
                            children: [
                              const VerticalSpace(value: 4),
                              Text(
                                translateString("Contact us", "تواصل معنا"),
                                style: headingStyle1(
                                  context: context,
                                  color: colorBlack,
                                ),
                              ),
                              const VerticalSpace(value: 2),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                  socialIcons.length,
                                  (index) => Container(
                                    width: screenWidth(context) * 0.1,
                                    height: screenHeight(context) * 0.04,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          screenWidth(context) * 0.02),
                                      border: Border.all(
                                        color: textFormFieldColor,
                                      ),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        socialIcons[index],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              )
            : loading();
      },
    );
  }
}
