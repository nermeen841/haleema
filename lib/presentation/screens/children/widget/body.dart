import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/children/cubit/children_cubit.dart';
import 'package:halema/presentation/screens/children/screen/add_child/add_child.dart';
import 'package:halema/presentation/screens/children/screen/child_detail/child_detail.dart';
import 'package:halema/presentation/screens/children/widget/add_childitem.dart';
import 'package:halema/presentation/widget/child_driver.dart';

class ChildrenBody extends StatefulWidget {
  const ChildrenBody({super.key});

  @override
  State<ChildrenBody> createState() => _ChildrenBodyState();
}

class _ChildrenBodyState extends State<ChildrenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChildrenCubit, ChildrenState>(
      listener: (context, state) {},
      bloc: GetIt.I<ChildrenCubit>(),
      builder: (context, state) {
        return (GetIt.I<ChildrenCubit>().allChildrenModel != null)
            ? SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight(context) * 0.02,
                  horizontal: screenWidth(context) * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AddChildItem(
                      ontap: () =>
                          MagicRouter.navigateTo(const AddChildScreen()),
                      title: translateString(
                          "Added a new child", "أضافه طفل جديد"),
                    ),
                    const VerticalSpace(value: 3),
                    ListView.separated(
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ChildDriverCard(
                        name: GetIt.I<ChildrenCubit>()
                            .allChildrenModel!
                            .childrens![index]
                            .name!,
                        date: GetIt.I<ChildrenCubit>()
                            .allChildrenModel!
                            .childrens![index]
                            .dateOfBirth!,
                        image: GetIt.I<ChildrenCubit>()
                            .allChildrenModel!
                            .childrens![index]
                            .imageUrl!,
                        ontap: () {
                          GetIt.I<ChildrenCubit>().getChildDetail(
                              GetIt.I<ChildrenCubit>()
                                  .allChildrenModel!
                                  .childrens![index]
                                  .id!);
                          MagicRouter.navigateTo(const ChildDetailScreen());
                        },
                      ),
                      separatorBuilder: (context, index) =>
                          const VerticalSpace(value: 1.5),
                      itemCount: GetIt.I<ChildrenCubit>()
                          .allChildrenModel!
                          .childrens!
                          .length,
                    ),
                  ],
                ),
              )
            : loading();
      },
    );
  }
}
