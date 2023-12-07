import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/detail/detail.dart';
import 'package:halema/presentation/screens/favourite/cubit/favourite_cubit.dart';
import 'package:halema/presentation/widget/empty_item.dart';
import 'package:halema/presentation/widget/favourite_card.dart';

class FavouriteBody extends StatefulWidget {
  const FavouriteBody({super.key});

  @override
  State<FavouriteBody> createState() => _FavouriteBodyState();
}

class _FavouriteBodyState extends State<FavouriteBody> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
      bloc: GetIt.I<FavouriteCubit>(),
      listener: (context, state) {},
      builder: (context, state) {
        return (GetIt.I<FavouriteCubit>().favouriteModel != null)
            ? SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight(context) * 0.03,
                  horizontal: screenWidth(context) * 0.03,
                ),
                child: (GetIt.I<FavouriteCubit>()
                        .favouriteModel!
                        .favourites!
                        .isNotEmpty)
                    ? ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () =>
                              MagicRouter.navigateTo(const DetailScreen()),
                          child: FavouriteCard(
                            setterId: GetIt.I<FavouriteCubit>()
                                .favouriteModel!
                                .favourites![index]
                                .setterId!,
                            completeOrders: GetIt.I<FavouriteCubit>()
                                .favouriteModel!
                                .favourites![index]
                                .setter!
                                .completedOrders
                                .toString(),
                            hourPrice: GetIt.I<FavouriteCubit>()
                                .favouriteModel!
                                .favourites![index]
                                .setter!
                                .hourPrice
                                .toString(),
                            name: GetIt.I<FavouriteCubit>()
                                .favouriteModel!
                                .favourites![index]
                                .setter!
                                .user!
                                .name!,
                            image: GetIt.I<FavouriteCubit>()
                                .favouriteModel!
                                .favourites![index]
                                .setter!
                                .user!
                                .imageUrl!,
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const VerticalSpace(value: 2),
                        itemCount: GetIt.I<FavouriteCubit>()
                            .favouriteModel!
                            .favourites!
                            .length,
                      )
                    : EmptyItem(
                        image: AppIcons.noFavouriteIcon,
                        title: translateString("No favourite", "لا مفضلات"),
                        content: translateString("",
                            "يمكنك إضافة عنصر إلى مفضلاتك عن طريق النقر فوق رمز النجمة"),
                      ))
            : loading();
      },
    );
  }
}
