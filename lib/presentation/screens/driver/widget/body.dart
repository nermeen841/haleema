import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/children/widget/add_childitem.dart';
import 'package:halema/presentation/screens/driver/cubit/driver_cubit.dart';
import 'package:halema/presentation/screens/driver/screen/add_driver/add_driver.dart';
import 'package:halema/presentation/screens/driver/screen/driver_detail/driver_detail.dart';
import 'package:halema/presentation/widget/child_driver.dart';

class DriverBody extends StatefulWidget {
  const DriverBody({super.key});

  @override
  State<DriverBody> createState() => _DriverBodyState();
}

class _DriverBodyState extends State<DriverBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit, DriverState>(
      listener: (context, state) {},
      bloc: GetIt.I<DriverCubit>(),
      builder: (context, state) {
        return (GetIt.I<DriverCubit>().driversModel != null)
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
                          MagicRouter.navigateTo(const AddDriverScreen()),
                      title: translateString(
                          "Added a new driver", "أضافه سائق جديد"),
                    ),
                    const VerticalSpace(value: 3),
                    ListView.separated(
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ChildDriverCard(
                        name: GetIt.I<DriverCubit>()
                            .driversModel!
                            .drivers![index]
                            .name!,
                        date: GetIt.I<DriverCubit>()
                            .driversModel!
                            .drivers![index]
                            .phone!,
                        image: GetIt.I<DriverCubit>()
                            .driversModel!
                            .drivers![index]
                            .imageUrl!,
                        ontap: () {
                          GetIt.I<DriverCubit>().getDriverDetail(
                              GetIt.I<DriverCubit>()
                                  .driversModel!
                                  .drivers![index]
                                  .id!);
                          MagicRouter.navigateTo(const DriverDetailScreen());
                        },
                      ),
                      separatorBuilder: (context, index) =>
                          const VerticalSpace(value: 1.5),
                      itemCount:
                          GetIt.I<DriverCubit>().driversModel!.drivers!.length,
                    ),
                  ],
                ),
              )
            : loading();
      },
    );
  }
}
