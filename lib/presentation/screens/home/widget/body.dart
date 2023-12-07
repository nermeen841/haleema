import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/home/widget/babySitters.dart';
import 'package:halema/presentation/screens/home/widget/map.dart';
import 'package:halema/presentation/screens/home/widget/nursery_list.dart';
import 'package:halema/presentation/screens/see_all/see_all.dart';
import 'package:halema/presentation/widget/section_title.dart';

import '../../../../core/router/router.dart';
import '../cubit/setter_cubit.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MapWidget(),
          SectionTitleWidget(
            onPressed: () {
              GetIt.I<SetterCubit>().getSetters("");
              MagicRouter.navigateTo(SeeAllScreen(
                type: 0,
                title: translateString("Baby Sitters", "المربيات"),
                searchtitle: translateString("Babysitter name", "اسم المربيه"),
              ));
            },
            type: 0,
            title: translateString("Baby Sitters", "المربيات"),
            searchtitle: translateString("Babysitter name", "اسم المربيه"),
          ),
          const BabbysittersList(),
          SectionTitleWidget(
            onPressed: () {
              // MagicRouter.navigateTo(SeeAllScreen(
              //   type: 1,
              //   title: translateString("Nursery", "الحضانات"),
              //   searchtitle: translateString("Nursery name", "اسم الحضانة"),
              // ));
            },
            type: 1,
            title: translateString("Nursery", "الحضانات"),
            searchtitle: translateString("Nursery name", "اسم الحضانة"),
          ),
          const NurseryList(),
          const VerticalSpace(value: 2),
        ],
      ),
    );
  }
}
