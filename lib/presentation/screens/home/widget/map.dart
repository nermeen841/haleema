import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/utiles/map.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';
import 'package:halema/presentation/widget/search.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  bool isExpanded = true;
  GoogleMapController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.02,
            horizontal: screenWidth(context) * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocConsumer<AuthCubit, AuthState>(
                bloc: GetIt.I<AuthCubit>(),
                listener: (context, state) {},
                builder: (context, state) {
                  return (GetIt.I<AuthCubit>().profileModel != null)
                      ? Text(
                          translateString(
                              "welcome ${GetIt.I<AuthCubit>().profileModel!.user!.name!}",
                              "أهلا ${GetIt.I<AuthCubit>().profileModel!.user!.name!}"),
                          style:
                              bodyStryle2(color: colorGrey, context: context),
                        )
                      : const SizedBox();
                },
              ),
              const VerticalSpace(value: 1),
              Text(
                translateString("Find the best babysitter here",
                    "أعثر على أفضل جليسة وحضانة هنا"),
                style: headingStyle1(color: colorBlack, context: context),
              ),
              const VerticalSpace(value: 3),
              SearchButton(
                fromHome: true,
                onChanged: (value) {
                  GetIt.I<SetterCubit>().getSetters(value);
                },
                title: translateString("Search map", "أبحث علي الخريطه"),
              ),
            ],
          ),
        ),
        // const VerticalSpace(value: 2),
        Container(
          width: double.infinity,
          height: (isExpanded)
              ? screenHeight(context) * 0.37
              : screenHeight(context) * 0.25,
          color: Colors.white,
          child: BlocConsumer<SetterCubit, SetterState>(
            listener: (context, state) {},
            bloc: GetIt.I<SetterCubit>(),
            builder: (context, state) {
              return (GetIt.I<SetterCubit>().getSettersModel != null)
                  ? GoogleMap(
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      zoomControlsEnabled: true,
                      zoomGesturesEnabled: true,
                      scrollGesturesEnabled: true,
                      compassEnabled: true,
                      onMapCreated: (controller) {
                        controller = controller;
                        Provider.of<MapProvider>(context, listen: false).info();
                      },
                      initialCameraPosition: CameraPosition(
                          target:
                              Provider.of<MapProvider>(context, listen: true)
                                  .latLng!,
                          zoom: 18),
                      onCameraIdle: () async {
                        await Provider.of<MapProvider>(context, listen: false)
                            .info();
                      },
                      markers: GetIt.I<SetterCubit>().markers)
                  : loading();
            },
          ),
        ),
        const VerticalSpace(value: 2),
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Icon(
            (isExpanded)
                ? Icons.keyboard_arrow_up_outlined
                : Icons.keyboard_arrow_down_outlined,
            color: colorGrey,
            size: screenWidth(context) * 0.1,
          ),
        ),
      ],
    );
  }
}
