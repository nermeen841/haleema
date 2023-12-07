// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, depend_on_referenced_packages

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/utiles/cubit/app_cubit.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors.dart';

appbarNoTitle() {
  return AppBar(
    toolbarHeight: 0.0,
    elevation: 0.0,
  );
}

/////////////////////////////////////////////////

late SharedPreferences prefs;

Future startShared() async {
  prefs = await SharedPreferences.getInstance();
}

//////////////////////////////////////////////////////////

String translateString(String english, String arabic) {
  return prefs.getString("lang") == 'en' ? english : arabic;
}

////////////////////////////////////////////////////////////

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

///////////////////////////////////////////////////////////

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

///////////////////////////////////////////////////////////

customCachedNetworkImage({required String url, required context, BoxFit? fit}) {
  try {
    // ignore: unnecessary_null_comparison
    if (url == null || url == "") {
      return Icon(
        Icons.error,
        color: kMainColor,
      );
    } else {
      return Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: (Uri.parse(url).isAbsolute)
            ? CachedNetworkImage(
                imageUrl: url,
                fit: fit,
                placeholder: (context, url) => Icon(
                      Icons.error,
                      color: kMainColor,
                    ),
                errorWidget: (context, url, error) {
                  return Icon(
                    Icons.error,
                    color: kMainColor,
                  );
                })
            : Icon(
                Icons.error,
                color: kMainColor,
              ),
      );
    }
  } catch (e) {
    print(e.toString());
  }
}

///////////////////////////////////////////////////////////////////

Widget loading() {
  return Center(
    child: CircularProgressIndicator(
      color: kMainColor,
    ),
  );
}

///////////////////////////////////////////////////////////////////

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;
  return parsedString;
}

///////////////////////////////////////////////////////////////////////////////////

homeBottomSheet({required BuildContext context, required Widget child}) {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(screenWidth(context) * 0.07),
        topLeft: Radius.circular(screenWidth(context) * 0.07),
      ),
    ),
    isDismissible: true,
    isScrollControlled: true,
    context: context,
    builder: (context) => Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: child,
    ),
  );
}

////////////////////////////////////////////////////////////////////////

void dialog(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: screenWidth(context),
            height: screenHeight(context),
            color: Colors.black12,
            child: Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            ),
          ),
        ),
        onWillPop: () async => false,
      );
    },
  );
}

/////////////////////////////////////////////////////////////////////////////
customAppbar({
  required String title,
  required context,
  VoidCallback? press,
  List<Widget>? actions,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: backgroundColor,
    centerTitle: true,
    automaticallyImplyLeading: false,
    iconTheme: IconThemeData(
      color: colorBlack,
    ),
    actions: actions ?? [],
    leading: IconButton(
        onPressed: press ?? () => MagicRouter.pop(),
        icon: const Icon(Icons.arrow_back)),
    title: Text(
      title,
      style: headingStyle1(context: context, color: colorBlack),
    ),
  );
}

////////////////////////////////////////////////////////////////////////

logoutDialog(context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(screenWidth(context) * 0.05),
        ),
      ),
      title: Center(
        child: SvgPicture.asset("assets/icons/sign-out-icon (2) 1.svg"),
      ),
      content: Text(
        translateString("Are you sure you want to logout ?",
            "هل انت متأكد من انك تريد تسجيل الخروج  ؟ "),
        style: bodyStryle(context: context, color: colorBlack),
      ),
      actions: [
        BlocConsumer<AuthCubit, AuthState>(
          bloc: GetIt.I<AuthCubit>(),
          listener: (context, state) {},
          builder: (context, state) {
            return SizedBox(
              width: screenWidth(context) * 0.4,
              child: CustomGeneralButton(
                text: translateString("ok", "موافق"),
                onTap: () => GetIt.I<AuthCubit>().postLogout(context),
              ),
            );
          },
        ),
        SizedBox(
          width: screenWidth(context) * 0.4,
          child: CustomGeneralButton(
            color: kMainColor.withOpacity(0.1),
            textColor: kMainColor,
            text: translateString("cancel", "إلغاء"),
            onTap: () => MagicRouter.pop(),
          ),
        ),
      ],
    ),
  );
}

/////////////////////////////////////////////////////////////////////////////
rattingDialog(context, TextEditingController controller, int id) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(screenWidth(context) * 0.05),
        ),
      ),
      title: Center(
        child: Text(
          translateString("Press stars for ratting", "أضغط علي النجمه للتقيم"),
          style: headingStyle2(context: context, color: colorBlack),
        ),
      ),
      content: SizedBox(
        height: screenHeight(context) * 0.5,
        child: Column(
          children: [
            BlocConsumer<AppCubit, AppState>(
              listener: (context, state) {},
              bloc: GetIt.I<AppCubit>(),
              builder: (context, state) {
                return RatingBar(
                  ignoreGestures: false,
                  allowHalfRating: false,
                  ratingWidget: RatingWidget(
                    full: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    half: const Icon(
                      Icons.star_half,
                      color: Colors.amber,
                    ),
                    empty: Icon(
                      Icons.star_outline,
                      color: colorGrey.withOpacity(0.2),
                    ),
                  ),
                  initialRating: GetIt.I<AppCubit>().ratting,
                  itemCount: 5,
                  itemSize: screenWidth(context) * 0.1,
                  onRatingUpdate: (double value) {
                    GetIt.I<AppCubit>().changeRatting(value);
                  },
                );
              },
            ),
            const VerticalSpace(value: 4),
            Text(
              translateString("Add review", "أضف مراجعتك"),
              style: headingStyle2(context: context, color: colorBlack),
            ),
            const VerticalSpace(value: 2),
            CustomTextFormField(
              controller: controller,
              hint: translateString("for example : be agood person",
                  "على سبيل المثال: كان شخصًا جيدًا"),
              maxLines: 5,
            ),
            const VerticalSpace(value: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocConsumer<SetterCubit, SetterState>(
                  listener: (context, state) {},
                  bloc: GetIt.I<SetterCubit>(),
                  builder: (context, state) {
                    return SizedBox(
                      width: screenWidth(context) * 0.35,
                      child: (state is! AddReviewsLoadingState)
                          ? CustomGeneralButton(
                              text: translateString("Save", "حفظ"),
                              onTap: () => GetIt.I<SetterCubit>().addReview(
                                id: id,
                                numOfStars: int.parse(GetIt.I<AppCubit>()
                                    .ratting
                                    .toString()
                                    .split('.')[0]),
                                review: controller.text,
                              ),
                            )
                          : loading(),
                    );
                  },
                ),
                const HorizontalSpace(value: 1),
                SizedBox(
                  width: screenWidth(context) * 0.4,
                  child: CustomGeneralButton(
                    color: kMainColor.withOpacity(0.1),
                    textColor: kMainColor,
                    text: translateString("cancel", "إلغاء"),
                    onTap: () => MagicRouter.pop(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

//////////////////////////////////////////////////////////////////////////////
String? image;

/////////////////////////////////////////////////////////////////////////////
uploadImage({
  required context,
  required VoidCallback ontapGallery,
  required VoidCallback ontapCamera,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(screenWidth(context) * 0.05),
        ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => MagicRouter.pop(),
            child: SvgPicture.asset("assets/icons/close-circle.svg"),
          ),
          const HorizontalSpace(value: 4),
          Text(
            translateString("select image from", "أختر الصور من "),
            style: headingStyle2(context: context, color: colorBlack),
          ),
        ],
      ),
      content: SizedBox(
        width: double.infinity,
        height: screenHeight(context) * 0.2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth(context) * 0.15,
                  height: screenHeight(context) * 0.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kMainColor),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: ontapCamera,
                      child: SvgPicture.asset("assets/icons/camera-icon 1.svg"),
                    ),
                  ),
                ),
                const VerticalSpace(value: 1),
                Text(
                  translateString("Camera", "الكاميرا"),
                  style: bodyStryle(context: context, color: colorBlack),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth(context) * 0.15,
                  height: screenHeight(context) * 0.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kMainColor),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: ontapGallery,
                      child: SvgPicture.asset("assets/icons/Group 37303.svg"),
                    ),
                  ),
                ),
                const VerticalSpace(value: 1),
                Text(
                  translateString("Gallery", "المعرض"),
                  style: bodyStryle(context: context, color: colorBlack),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

////////////////////////////////////////////////////
String getOrderPrice({
  required int hours,
  required num hoursPrice,
  required num discount,
}) {
  num finalPrice = (hoursPrice * hours) - discount;
  return finalPrice.toStringAsFixed(2);
}

/////////////////////////////////////////////////////////////////////
BitmapDescriptor? mapicon;
initialMapMarker() {
  BitmapDescriptor.fromAssetImage(
          ImageConfiguration.empty, "assets/icons/sitter.png")
      .then((value) {
    mapicon = value;
  });
}
