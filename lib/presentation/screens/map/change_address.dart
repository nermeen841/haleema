// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/utiles/map.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:provider/provider.dart';

import '../detail/screens/reservation/widget/body.dart';

class ChangeAddressScreen extends StatefulWidget {
  static double? lat;
  static double? long;
  final bool? fomUpdateprofile;
  const ChangeAddressScreen({super.key, this.fomUpdateprofile});

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  GoogleMapController? _controller;
  bool mapTypeEnabled = false;
  void updatePosition(CameraPosition position, context) {
    _controller!.animateCamera(CameraUpdate.newCameraPosition(position));
    Provider.of<MapProvider>(context, listen: false).updateLat(position.target);
    address.text = Provider.of<MapProvider>(context, listen: false).street!;
  }

  @override
  Widget build(BuildContext context) {
    MapProvider map = Provider.of<MapProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => MagicRouter.pop(),
          child: SvgPicture.asset(
            AppIcons.arrowBack,
            width: screenWidth(context) * 0.1,
            fit: BoxFit.scaleDown,
          ),
        ),
        centerTitle: true,
        title: SizedBox(
          width: screenWidth(context) * 0.8,
          height: screenHeight(context) * 0.06,
          child: CustomTextFormField(
            fillColor: Colors.white,
            borderColor: Colors.transparent,
            hint: translateString("Search", "بحث"),
            prefix: SvgPicture.asset(
              AppIcons.searchNormalIcon,
              width: 5,
              height: 5,
              fit: BoxFit.scaleDown,
            ),
            onEditingComplete: () {
              if (map.predictions.isNotEmpty) {
                map.clearPlaces();
              }
            },
            onChanged: (value) {
              if (value != "" && value != null) {
                map.autoCompleteSearch(value);
              } else {
                map.clearPlaces();
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          setState(() {
            mapTypeEnabled = !mapTypeEnabled;
          });
        },
        backgroundColor: Colors.white54,
        child: Icon(
          Icons.change_circle_outlined,
          size: screenWidth(context) * 0.08,
          color: colorBlack,
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: screenHeight(context) * 0.15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              screenWidth(context) * 0.03,
            ),
            topRight: Radius.circular(
              screenWidth(context) * 0.03,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * 0.03,
          vertical: screenHeight(context) * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/icons/noun-pin.png",
                  scale: 4,
                ),
                const HorizontalSpace(value: 1),
                if (map.street == null)
                  Text(
                    translateString('Add address', 'اضف عنوان'),
                    style: bodyStryle(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                if (map.street != null)
                  SizedBox(
                    width: screenWidth(context) * 0.8,
                    child: Text(
                      map.street!,
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                      style: bodyStryle(
                        context: context,
                        color: colorBlack,
                      ),
                    ),
                  )
              ],
            ),
            const VerticalSpace(value: 2),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {},
              bloc: GetIt.I<AuthCubit>(),
              builder: (context, state) {
                if (widget.fomUpdateprofile == true) {
                  return SizedBox(
                    height: screenHeight(context) * 0.06,
                    child: (state is! UpdateProfileLoadingState)
                        ? CustomGeneralButton(
                            text: translateString("change", "تغيير"),
                            onTap: () {
                              setState(() {
                                address.text = map.street!;
                                ChangeAddressScreen.lat = map.latLng!.latitude;
                                ChangeAddressScreen.long =
                                    map.latLng!.longitude;
                              });
                              if (widget.fomUpdateprofile == true) {
                                address.text = map.street ?? "";
                                GetIt.I<AuthCubit>().updateProfile(
                                  lat: map.latLng!.latitude,
                                  long: map.latLng!.longitude,
                                  address: map.street,
                                );
                              }
                              MagicRouter.pop();
                            },
                          )
                        : loading(),
                  );
                } else {
                  return SizedBox(
                    height: screenHeight(context) * 0.06,
                    child: CustomGeneralButton(
                      text: translateString("change", "تغيير"),
                      onTap: () {
                        setState(() {
                          ChangeAddressScreen.lat = map.latLng!.latitude;
                          ChangeAddressScreen.long = map.latLng!.longitude;
                        });

                        MagicRouter.pop();
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: screenHeight(context),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            SafeArea(
              child: Stack(
                children: [
                  map.latLng == null
                      ? Center(
                          child: CircularProgressIndicator(
                            color: kMainColor,
                          ),
                        )
                      : GoogleMap(
                          myLocationButtonEnabled: true,
                          myLocationEnabled: false,
                          zoomControlsEnabled: true,
                          mapType: (mapTypeEnabled)
                              ? MapType.satellite
                              : MapType.normal,
                          onMapCreated: (controller) {
                            _controller = controller;
                            map.info();
                          },
                          initialCameraPosition:
                              CameraPosition(target: map.latLng!, zoom: 18),
                          onCameraIdle: () async {
                            await map.info();
                          },
                          markers: <Marker>{
                            Marker(
                              draggable: true,
                              markerId: const MarkerId('Marker'),
                              position: map.latLng!,
                              icon: map.icon != null
                                  ? map.icon!
                                  : BitmapDescriptor.defaultMarker,
                            )
                          },
                          onCameraMove: (position) =>
                              updatePosition(position, context),
                        ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: InkWell(
                      onTap: () async {
                        await map.start();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth(context) * 0.03),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.gps_fixed,
                            color: colorBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (map.predictions.isNotEmpty)
                    Positioned(
                      // top: screenHeight(context) * 0.001,
                      right: screenWidth(context) * 0.1,
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 5,
                        child: Container(
                          width: screenWidth(context) * 0.8,
                          constraints: BoxConstraints(
                            minHeight: screenHeight(context) * 0.1,
                            maxHeight: screenHeight(context) * 0.55,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: List.generate(map.predictions.length,
                                    (index) {
                                  return ListTile(
                                    leading: const CircleAvatar(
                                      child: Icon(
                                        Icons.pin_drop,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: Text(
                                        map.predictions[index].description!),
                                    onTap: () async {
                                      var result = await map.googlePlace.details
                                          .get(map.predictions[index].placeId!);
                                      if (result != null &&
                                          result.result != null) {
                                        final lat = result
                                            .result!.geometry!.location!.lat;
                                        final lng = result
                                            .result!.geometry!.location!.lng;
                                        _controller!.moveCamera(
                                            CameraUpdate.newLatLng(
                                                LatLng(lat!, lng!)));
                                        map.latLng = LatLng(lat, lng);
                                        map.clearPlaces();
                                        map.info();
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      }
                                    },
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
