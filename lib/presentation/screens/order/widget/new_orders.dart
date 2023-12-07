import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:haleema/core/constants/app_icons.dart';
import 'package:haleema/core/constants/colors.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/core/router/router.dart';
import 'package:haleema/core/utiles/cubit/app_cubit.dart';
import 'package:haleema/core/widgets/space_widget.dart';
import 'package:haleema/presentation/screens/order/screens/order_detail/order_detail.dart';
import 'package:haleema/presentation/widget/empty_item.dart';
import 'package:haleema/presentation/widget/order_card.dart';
import 'package:haleema/presentation/widget/profile_not_complete.dart';

class NewOrdersItem extends StatefulWidget {
  const NewOrdersItem({super.key});

  @override
  State<NewOrdersItem> createState() => _NewOrdersItemState();
}

class _NewOrdersItemState extends State<NewOrdersItem> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      bloc: GetIt.I<AppCubit>(),
      builder: (context, state) {
        return (show)
            ? InkWell(
                onTap: () {
                  setState(() {
                    show = true;
                  });
                },
                child: (show)
                    ? ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => MagicRouter.navigateTo(
                            OrderDetailScreen(
                              statuse: "طلب جديد",
                              color: colorYellow,
                            ),
                          ),
                          child: OrderCardItem(
                            orderStatuse: "طلب جديد",
                            orderColor: colorYellow,
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const VerticalSpace(value: 1),
                        itemCount: 6,
                      )
                    : EmptyItem(
                        image: AppIcons.emptyOrdersIcon,
                        title: translateString(
                            "There is no request yet", "لا يوجد طلب حتى الآن"),
                        content: translateString(
                            "When you have requests, you will find them here",
                            "عندما يكون لديك طلبات ، سوف تجدها هنا"),
                      ),
              )
            : InkWell(
                onTap: () {
                  setState(() {
                    show = true;
                  });
                },
                child: const ProfileNotCopmlete(),
              );
      },
    );
  }
}
