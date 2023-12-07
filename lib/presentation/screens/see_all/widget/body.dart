import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';
import 'package:halema/presentation/screens/see_all/widget/filter.dart';
import 'package:halema/presentation/screens/see_all/widget/filter_list.dart';
import 'package:halema/presentation/screens/see_all/widget/setter_list.dart';
import 'package:halema/presentation/widget/search.dart';

class SeeAllBody extends StatefulWidget {
  final String searchtitle;
  final int type;
  const SeeAllBody({super.key, required this.searchtitle, required this.type});

  @override
  State<SeeAllBody> createState() => _SeeAllBodyState();
}

class _SeeAllBodyState extends State<SeeAllBody> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetterCubit, SetterState>(
      listener: (context, state) {},
      bloc: GetIt.I<SetterCubit>(),
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.02,
            vertical: screenHeight(context) * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: SearchButton(
                      title: widget.searchtitle,
                      onChanged: (value) {
                        if (value != "" && value != null) {
                          setState(() {
                            isSearching = true;
                          });
                        } else {
                          isSearching = false;
                        }
                        GetIt.I<SetterCubit>().getSetters(value);
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () => homeBottomSheet(
                      context: context,
                      child: const FilterItem(),
                    ),
                    child: Image.asset(AppIcons.filterButtonIcon),
                  ),
                ],
              ),
              const VerticalSpace(value: 2),
              (GetIt.I<SetterCubit>().isFilterring && !isSearching)
                  ? FilterSetterListWidget(type: widget.type)
                  : SetterListWidget(type: widget.type)
            ],
          ),
        );
      },
    );
  }
}
