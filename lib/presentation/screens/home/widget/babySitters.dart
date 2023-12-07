import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/presentation/screens/detail/detail.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';
import 'package:halema/presentation/widget/babysitter_card.dart';

class BabbysittersList extends StatelessWidget {
  const BabbysittersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetterCubit, SetterState>(
      bloc: GetIt.I<SetterCubit>(),
      listener: (context, state) {},
      builder: (context, state) {
        return (GetIt.I<SetterCubit>().getSettersModel != null)
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: (GetIt.I<SetterCubit>()
                        .getSettersModel!
                        .setters!
                        .data!
                        .isNotEmpty)
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          GetIt.I<SetterCubit>()
                              .getSettersModel!
                              .setters!
                              .data!
                              .length,
                          (index) => InkWell(
                            onTap: () {
                              dialog(context);
                              GetIt.I<SetterCubit>()
                                  .getSetterDetail(GetIt.I<SetterCubit>()
                                      .getSettersModel!
                                      .setters!
                                      .data![index]
                                      .id!)
                                  .then((value) =>
                                      MagicRouter.navigateAndPReplacement(
                                          const DetailScreen()));
                            },
                            child: BabbySitterCard(
                              rate: (GetIt.I<SetterCubit>()
                                          .getSettersModel!
                                          .setters!
                                          .data![index]
                                          .user!
                                          .avgNumOfStars !=
                                      null)
                                  ? double.parse(GetIt.I<SetterCubit>()
                                      .getSettersModel!
                                      .setters!
                                      .data![index]
                                      .user!
                                      .avgNumOfStars
                                      .toString())
                                  : 0.0,
                              name: GetIt.I<SetterCubit>()
                                  .getSettersModel!
                                  .setters!
                                  .data![index]
                                  .user!
                                  .name!,
                              image: GetIt.I<SetterCubit>()
                                  .getSettersModel!
                                  .setters!
                                  .data![index]
                                  .user!
                                  .imageUrl!,
                              adderss: GetIt.I<SetterCubit>()
                                      .getSettersModel!
                                      .setters!
                                      .data![index]
                                      .user!
                                      .address ??
                                  "",
                              numOfSesstion: GetIt.I<SetterCubit>()
                                  .getSettersModel!
                                  .setters!
                                  .data![index]
                                  .completedOrders
                                  .toString(),
                              priceHour: GetIt.I<SetterCubit>()
                                      .getSettersModel!
                                      .setters!
                                      .data![index]
                                      .hourPrice ??
                                  "",
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              )
            : loading();
      },
    );
  }
}
