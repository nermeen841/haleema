import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/detail/detail.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';
import 'package:halema/presentation/screens/see_all/widget/item_card.dart';

class FilterSetterListWidget extends StatelessWidget {
  final int type;
  const FilterSetterListWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetterCubit, SetterState>(
      bloc: GetIt.I<SetterCubit>(),
      listener: (context, state) {},
      builder: (context, state) => (state is FilterSetterLoadingState)
          ? loading()
          : (GetIt.I<SetterCubit>().filterSetterModel.isNotEmpty)
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
                            .then((value) =>
                                MagicRouter.navigateAndPReplacement(
                                    const DetailScreen()));
                      }
                    },
                    child: ItemCard(
                      rate: (GetIt.I<SetterCubit>()
                                  .filterSetterModel[index]
                                  .user!
                                  .avgNumOfStars !=
                              null)
                          ? double.parse(GetIt.I<SetterCubit>()
                              .filterSetterModel[index]
                              .user!
                              .avgNumOfStars
                              .toString())
                          : 0.0,
                      hourPrice: GetIt.I<SetterCubit>()
                              .filterSetterModel[index]
                              .hourPrice ??
                          "",
                      name: GetIt.I<SetterCubit>()
                          .filterSetterModel[index]
                          .user!
                          .name!,
                      image: GetIt.I<SetterCubit>()
                          .filterSetterModel[index]
                          .user!
                          .imageUrl!,
                      address: GetIt.I<SetterCubit>()
                              .filterSetterModel[index]
                              .user!
                              .address ??
                          "",
                      completedOrders: GetIt.I<SetterCubit>()
                          .filterSetterModel[index]
                          .completedOrders!
                          .toString(),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const VerticalSpace(value: 2),
                  itemCount: GetIt.I<SetterCubit>().filterSetterModel.length,
                )
              : Padding(
                  padding: EdgeInsets.only(top: screenHeight(context) * 0.2),
                  child: Center(
                    child: Text(
                      translateString(
                          "no result found", "لم يتم العثور علي اي نتائج"),
                      style: headingStyle3(
                        context: context,
                        color: kMainColor,
                      ),
                    ),
                  ),
                ),
    );
  }
}
