import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/presentation/screens/see_all/widget/item_card.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/router/router.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../detail/detail.dart';
import '../../home/cubit/setter_cubit.dart';

class SetterListWidget extends StatelessWidget {
  final int type;
  const SetterListWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetterCubit, SetterState>(
      bloc: GetIt.I<SetterCubit>(),
      listener: (context, state) {},
      builder: (context, state) => (GetIt.I<SetterCubit>().getSettersModel !=
              null)
          ? ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  if (type == 0) {
                    dialog(context);
                    GetIt.I<SetterCubit>()
                        .getSetterDetail(GetIt.I<SetterCubit>()
                            .getSettersModel!
                            .setters!
                            .data![index]
                            .id!)
                        .then((value) => MagicRouter.navigateAndPReplacement(
                            const DetailScreen()));
                  }
                },
                child: ItemCard(
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
                  hourPrice: GetIt.I<SetterCubit>()
                          .getSettersModel!
                          .setters!
                          .data![index]
                          .hourPrice ??
                      "",
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
                  address: GetIt.I<SetterCubit>()
                          .getSettersModel!
                          .setters!
                          .data![index]
                          .user!
                          .address ??
                      "",
                  completedOrders: GetIt.I<SetterCubit>()
                      .getSettersModel!
                      .setters!
                      .data![index]
                      .completedOrders!
                      .toString(),
                ),
              ),
              separatorBuilder: (context, index) =>
                  const VerticalSpace(value: 2),
              itemCount:
                  GetIt.I<SetterCubit>().getSettersModel!.setters!.data!.length,
            )
          : loading(),
    );
  }
}
