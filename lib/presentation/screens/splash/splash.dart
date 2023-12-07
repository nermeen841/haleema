import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/network/dynamic_link.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:halema/presentation/screens/auth/login/login.dart';
import 'package:halema/presentation/screens/layout/layout.dart';
import 'package:halema/presentation/screens/onBoarding/onBoarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget screen = const OnBoardingScreen();
  getStart() {
    if (prefs.getBool("is_onboearding") == true) {
      if (prefs.getBool("login") == true) {
        setState(() {
          screen = const LayoutScreen();
        });
      } else {
        setState(() {
          screen = const LoginScreen();
        });
      }
    } else {
      setState(() {
        screen = const OnBoardingScreen();
      });
    }
  }

  @override
  void initState() {
    getStart();
    
    GetIt.I<AuthCubit>().lookupUserCountry();
    DynamicLinkService().handleDynamicLinks();
    Timer(const Duration(seconds: 1),
        () => MagicRouter.navigateAndPopAll(screen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(AppIcons.logo),
      ),
    );
  }
}
