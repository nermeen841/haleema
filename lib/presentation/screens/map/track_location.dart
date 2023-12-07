import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/utiles/map.dart';
import 'package:provider/provider.dart';

class TrackLocationScreen extends StatefulWidget {
  const TrackLocationScreen(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.setterName});
  final double latitude;
  final double longitude;
  final String setterName;

  @override
  State<TrackLocationScreen> createState() => _TrackLocationScreenState();
}

class _TrackLocationScreenState extends State<TrackLocationScreen> {
  GoogleMapController? mapController; //contrller for Google map
  List<Polyline> myPolyline = [];
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    createPolyline();

    markers.add(
      Marker(
        //add start location marker
        markerId: const MarkerId("marker1"),
        position:
            LatLng(widget.latitude, widget.longitude), //position of marker
        infoWindow: InfoWindow(
          title: widget.setterName,
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );

    markers.add(
      Marker(
          markerId: const MarkerId("marker 2"),
          position: Provider.of<MapProvider>(context, listen: false)
              .latLng!, //position of marker
          infoWindow: const InfoWindow(
            //popup info
            title: "",
            snippet: "",
          ),
          icon: BitmapDescriptor.defaultMarker //Icon for Marker
          ),
    );
  }

  createPolyline() {
    myPolyline.add(
      Polyline(
          polylineId: const PolylineId('1'),
          color: const Color(0xff3366cc),
          width: 5,
          points: [
            Provider.of<MapProvider>(context, listen: false).latLng!,
            Provider.of<MapProvider>(context, listen: false).latLng!
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      body: Stack(
        children: [
          googleMapUI(),
          backIcon(w: w, h: h),
        ],
      ),
    );
  }

  backIcon({required double w, required double h}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * 0.02,
          vertical: screenHeight(context) * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => MagicRouter.pop(),
            child: SvgPicture.asset(
              AppIcons.arrowBack,
            ),
          ),
          // SizedBox(
          //   width: screenWidth(context) * 0.8,
          //   height: screenHeight(context) * 0.07,
          //   child: CustomTextFormField(
          //     fillColor: Colors.white,
          //     borderColor: Colors.transparent,
          //     hint: translateString("Search", "بحث"),
          //     prefix: SvgPicture.asset(
          //       AppIcons.searchNormalIcon,
          //       width: 5,
          //       height: 5,
          //       fit: BoxFit.scaleDown,
          //     ),
          //     onChanged: (value) {
          //       if (value.isNotEmpty) {
          //         map.autoCompleteSearch(value);
          //       } else {
          //         if (map.predictions.isNotEmpty) {
          //           map.clearPlaces();
          //         }
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget googleMapUI() {
    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            mapType: MapType.normal,

            markers: markers,
            initialCameraPosition: CameraPosition(
              target: Provider.of<MapProvider>(context, listen: false).latLng!,
              zoom: 10,
            ),
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller) async {},
            // circles: circles,
            polylines: myPolyline.toSet(),
          ),
        ),
      ],
    );
  }

////////////////////////////////////////////////////////////////////////////////////////

}
