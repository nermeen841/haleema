import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:halema/presentation/screens/home/widget/body.dart';
import 'package:halema/presentation/screens/notifications/cubit/notification_cubit.dart';
import 'package:halema/presentation/screens/notifications/notification.dart';

import 'cubit/setter_cubit.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    GetIt.I<SetterCubit>().getSetters("");
    GetIt.I<AuthCubit>().getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: SvgPicture.asset(
            AppIcons.menueIcon,
            width: 10,
            height: 10,
            fit: BoxFit.scaleDown,
          ),
          onTap: () => scaffoldKey.currentState!.openDrawer(),
        ),
        actions: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.03),
            child: InkWell(
              child: SvgPicture.asset(
                AppIcons.notifyIcon,
                color: colorBlack,
              ),
              onTap: () {
                dialog(context);
                GetIt.I<NotificationCubit>().getnotification().then(
                      (value) => MagicRouter.navigateAndPReplacement(
                        const NotificationScreen(),
                      ),
                    );
              },
            ),
          ),
        ],
      ),
      body: const HomeBody(),
    );
  }
}
