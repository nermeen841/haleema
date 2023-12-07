import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/children/cubit/children_cubit.dart';

class ExpandableSelection extends StatefulWidget {
  // static Map<int, bool> isSelected = {};

  const ExpandableSelection({super.key});
  @override
  State<ExpandableSelection> createState() => _ExpandableSelectionState();
}

class _ExpandableSelectionState extends State<ExpandableSelection> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChildrenCubit, ChildrenState>(
      bloc: GetIt.I<ChildrenCubit>(),
      listener: (context, state) {},
      builder: (context, state) {
        return (GetIt.I<ChildrenCubit>().allChildrenModel != null)
            ? Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: textFormFieldColor,
                  borderRadius: BorderRadius.circular(
                    screenWidth(context) * 0.03,
                  ),
                ),
                child: ExpansionTile(
                  backgroundColor: textFormFieldColor,
                  iconColor: colorGrey,
                  title: Text(
                    translateString("Select child", "اختر الاطفال"),
                    style: bodyStryle(
                      context: context,
                      color: colorGrey,
                    ),
                  ),
                  trailing: Icon(
                    _customTileExpanded
                        ? Icons.keyboard_arrow_up_outlined
                        : Icons.keyboard_arrow_down_outlined,
                  ),
                  children: List.generate(
                    GetIt.I<ChildrenCubit>()
                        .allChildrenModel!
                        .childrens!
                        .length,
                    (index) => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            GetIt.I<ChildrenCubit>().selectChildren(
                              id: GetIt.I<ChildrenCubit>()
                                  .allChildrenModel!
                                  .childrens![index]
                                  .id!,
                              name: GetIt.I<ChildrenCubit>()
                                  .allChildrenModel!
                                  .childrens![index]
                                  .name!,
                              image: GetIt.I<ChildrenCubit>()
                                  .allChildrenModel!
                                  .childrens![index]
                                  .imageUrl!,
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: kMainColor,
                                    radius: screenWidth(context) * 0.05,
                                    backgroundImage: NetworkImage(
                                      GetIt.I<ChildrenCubit>()
                                          .allChildrenModel!
                                          .childrens![index]
                                          .imageUrl!,
                                    ),
                                  ),
                                  const HorizontalSpace(value: 1),
                                  Text(
                                    GetIt.I<ChildrenCubit>()
                                        .allChildrenModel!
                                        .childrens![index]
                                        .name!,
                                    style: bodyStryle(
                                      context: context,
                                      color: colorBlack,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.check_box,
                                color: (GetIt.I<ChildrenCubit>()
                                        .childrenSeleted
                                        .contains(GetIt.I<ChildrenCubit>()
                                            .allChildrenModel!
                                            .childrens![index]
                                            .id!))
                                    ? kMainColor
                                    : kMainColor.withOpacity(0.3),
                              ),
                            ],
                          ),
                        ),
                        const VerticalSpace(value: 1),
                      ],
                    ),
                  ),
                  onExpansionChanged: (bool expanded) {
                    setState(() {
                      _customTileExpanded = expanded;
                    });
                  },
                ),
              )
            : LinearProgressIndicator(
                color: kMainColor,
              );
      },
    );
  }
}
