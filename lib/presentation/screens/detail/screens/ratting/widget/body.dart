import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/detail/screens/ratting/widget/header.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';
import 'package:halema/presentation/widget/ratting_card.dart';

class RattingBody extends StatefulWidget {
  const RattingBody({super.key});

  @override
  State<RattingBody> createState() => _RattingBodyState();
}

class _RattingBodyState extends State<RattingBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetterCubit, SetterState>(
      listener: (context, state) {},
      bloc: GetIt.I<SetterCubit>(),
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.02,
            horizontal: screenWidth(context) * 0.04,
          ),
          child: Column(
            children: [
              HeaderImageData(),
              const VerticalSpace(value: 4),
              ListView.separated(
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) => RattingCardItem(
                  userNmae: (GetIt.I<SetterCubit>()
                              .getReviewModel!
                              .data!
                              .reviews![index]
                              .rateFrom !=
                          null)
                      ? GetIt.I<SetterCubit>()
                          .getReviewModel!
                          .data!
                          .reviews![index]
                          .rateFrom!
                          .name!
                      : "",
                  review: GetIt.I<SetterCubit>()
                      .getReviewModel!
                      .data!
                      .reviews![index]
                      .review!,
                  rateValue: (GetIt.I<SetterCubit>()
                              .getReviewModel!
                              .data!
                              .reviews![index]
                              .numOfStars !=
                          null)
                      ? double.parse(GetIt.I<SetterCubit>()
                          .getReviewModel!
                          .data!
                          .reviews![index]
                          .numOfStars!
                          .toString())
                      : 0.0,
                  date: DateFormat(
                          'EEEE,  d MMM yyyy', prefs.getString("lang") ?? "ar")
                      .format(
                    DateTime.parse(GetIt.I<SetterCubit>()
                        .getReviewModel!
                        .data!
                        .reviews![index]
                        .createdAt!),
                  ),
                ),
                separatorBuilder: (context, index) =>
                    const VerticalSpace(value: 1),
                itemCount: GetIt.I<SetterCubit>()
                    .getReviewModel!
                    .data!
                    .reviews!
                    .length,
              ),
            ],
          ),
        );
      },
    );
  }
}
