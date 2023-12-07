// ignore_for_file: deprecated_member_use

import 'package:api_request/api_request.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/generator/locale_keys.dart';
import 'package:halema/presentation/screens/chnage_phone/screens/change_phone.dart';
import 'package:halema/presentation/screens/chnage_phone/screens/success.dart';
import 'package:halema/presentation/screens/favourite/favourite.dart';
import 'package:halema/presentation/screens/home/home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:halema/presentation/screens/info/info.dart';
import 'package:halema/presentation/screens/splash/splash.dart';
import 'package:halema/presentation/screens/support/cubit/support_cubit.dart';
import 'package:halema/presentation/screens/support/support.dart';

import '../../../../generator/localization_constant.dart';
import '../../favourite/cubit/favourite_cubit.dart';
import '../../order/cubit/orders_cubit.dart';
import 'drawer_componnent.dart';

class DrawerItems extends StatefulWidget {
  const DrawerItems({super.key});

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context) * 0.7,
      height: screenHeight(context),
      decoration: BoxDecoration(
        borderRadius: (prefs.getString("lang") != "en")
            ? BorderRadius.only(
                topLeft: Radius.circular(
                  screenWidth(context) * 0.04,
                ),
                bottomLeft: Radius.circular(
                  screenWidth(context) * 0.04,
                ),
              )
            : BorderRadius.only(
                topRight: Radius.circular(
                  screenWidth(context) * 0.04,
                ),
                bottomRight: Radius.circular(
                  screenWidth(context) * 0.04,
                ),
              ),
      ),
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => scaffoldKey.currentState!.closeDrawer(),
                      child: Icon(
                        Icons.arrow_back,
                        color: colorBlack,
                      ),
                    ),
                    const HorizontalSpace(value: 6),
                    Text(
                      translateString("Setting", "الإعدادات"),
                      style: headingStyle1(context: context, color: colorBlack),
                    ),
                  ],
                ),
              ),
              drawerItem(
                  title: translateString("Favourite", "المفضلة"),
                  icon: AppIcons.solidPinkHeartIcon,
                  ontap: () {
                    GetIt.I<FavouriteCubit>().getFavourite();
                    MagicRouter.navigateTo(const FavouriteScreen());
                  },
                  context: context),
              drawerItem(
                  title: (prefs.getString("lang") == null ||
                          prefs.getString("lang") == "ar")
                      ? "English"
                      : "اللغة العربية",
                  icon: AppIcons.publicIcon,
                  ontap: () {
                    if (prefs.getString("lang") == null ||
                        prefs.getString("lang") == "ar") {
                      ApiRequestOptions.instance
                          ?.config(defaultHeaders: {"lang": "en"});
                      ApiRequestOptions.refreshConfig();
                      setState(() {
                        setLocale("en");
                        context.locale = const Locale("en");
                        prefs.setString("lang", "en");
                        prefs.setString("language", "English");
                      });
                    } else {
                      ApiRequestOptions.instance
                          ?.config(defaultHeaders: {"lang": "ar"});
                      ApiRequestOptions.refreshConfig();
                      setState(() {
                        setLocale("en");
                        context.locale = const Locale("ar");
                        prefs.setString("lang", "ar");
                        prefs.setString("language", "اللغة العربية");
                      });
                    }

                    MagicRouter.navigateAndPopAll(const SplashScreen());
                  },
                  context: context),
              drawerItem(
                  title: translateString(
                      "Change phone number", "تغيير رقم الجوال"),
                  icon: AppIcons.phoneRingingIconPink,
                  ontap: () => MagicRouter.navigateTo(ChangePhoneScreen(
                        ontap: () => MagicRouter.navigateAndPReplacement(
                            const SuccessScreen()),
                        title: translateString(
                            "Enter new phone number", "أدخل رقم الجوال الجديد"),
                      )),
                  context: context),
              const VerticalSpace(value: 1),
              sectiontitle(
                  translateString("Technical Support", "الدعم"), context),
              const VerticalSpace(value: 1),
              drawerItem(
                  title: translateString(
                      "Support and assistance", "الدعم و المساعده"),
                  icon: AppIcons.serviceSupportIcon,
                  ontap: () {
                    GetIt.I<SupportCubit>().getMytickets();
                    GetIt.I<SupportCubit>().getOrderSetters();
                    MagicRouter.navigateTo(const SupportScreen());
                  },
                  context: context),
              drawerItem(
                  title: translateString("About Haleemh", "عن حليمه"),
                  icon: AppIcons.informationIcon,
                  ontap: () {
                    GetIt.I<OrdersCubit>().getSetting();
                    MagicRouter.navigateTo(
                      InfoScreen(
                          title: translateString("About Haleemh", "عن حليمه"),
                          showSocial: true),
                    );
                  },
                  context: context),
              drawerItem(
                  title: translateString("Privacy policy", "السياسة والخصوصية"),
                  icon: AppIcons.privacy,
                  ontap: () {
                    GetIt.I<OrdersCubit>().getSetting();
                    MagicRouter.navigateTo(
                      InfoScreen(
                        title: translateString(
                            "Privacy policy", "السياسة والخصوصية"),
                        showSocial: false,
                      ),
                    );
                  },
                  context: context),
              const VerticalSpace(value: 1),
              sectiontitle(translateString("Account", "الحساب"), context),
              const VerticalSpace(value: 1),
              drawerItem(
                  title: LocaleKeys.LOG_OUT.tr(),
                  icon: AppIcons.logoutIcon,
                  ontap: () => logoutDialog(context),
                  context: context),
            ],
          ),
        ),
      ),
    );
  }
}
