import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/driver/cubit/driver_cubit.dart';

class DriversSelection extends StatefulWidget {
  const DriversSelection({super.key});

  @override
  State<DriversSelection> createState() => _DriversSelectionState();
}

class _DriversSelectionState extends State<DriversSelection> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit, DriverState>(
      bloc: GetIt.I<DriverCubit>(),
      listener: (context, state) {},
      builder: (context, state) {
        return (GetIt.I<DriverCubit>().driversModel != null)
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
                    translateString("Select Driver", "اختر السائق"),
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
                    GetIt.I<DriverCubit>().driversModel!.drivers!.length,
                    (index) => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              GetIt.I<DriverCubit>().selectedDriverData(
                                  name: GetIt.I<DriverCubit>()
                                      .driversModel!
                                      .drivers![index]
                                      .name!,
                                  image: GetIt.I<DriverCubit>()
                                      .driversModel!
                                      .drivers![index]
                                      .imageUrl!);
                            });
                            GetIt.I<DriverCubit>().selectDriver(
                                GetIt.I<DriverCubit>()
                                    .driversModel!
                                    .drivers![index]
                                    .id!);
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
                                      GetIt.I<DriverCubit>()
                                          .driversModel!
                                          .drivers![index]
                                          .imageUrl!,
                                    ),
                                  ),
                                  const HorizontalSpace(value: 1),
                                  Text(
                                    GetIt.I<DriverCubit>()
                                        .driversModel!
                                        .drivers![index]
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
                                color: (GetIt.I<DriverCubit>().driverId ==
                                        GetIt.I<DriverCubit>()
                                            .driversModel!
                                            .drivers![index]
                                            .id!)
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
