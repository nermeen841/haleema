// ignore_for_file: deprecated_member_use

import 'package:api_request/api_request.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:halema/core/constants/theme.dart';
import 'package:halema/core/network/appbinding.dart';
import 'package:halema/core/network/firebase_services.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/generator/localization_constant.dart';
import 'package:provider/provider.dart';

import 'core/constants/constants.dart';
import 'core/utiles/bloc_observer.dart';
import 'core/utiles/map.dart';
import 'generator/codegen_loader.dart';
import 'presentation/screens/splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBinding.initAsyncDependebcies();
  FirebaseServices().intializeFirebase();
  ApiRequestOptions.instance?.config(
    baseUrl: 'http://api.haleemh.sa/api',
    tokenType: ApiRequestOptions.bearer,
    getToken: () => prefs.getString('token') ?? '',
    enableLog: true,
    defaultHeaders: {
      "Accept": "application/json",
      "lang": prefs.getString("lang") == "en" ? "en" : "ar"
    },
  );

  BlocOverrides.runZoned(
    () => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        path: 'asset/translation',
        assetLoader: const CodegenLoader(),
        child: const MyApp(),
      ),
    ),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setLocale(Locale locale) async {
    setState(() {
      context.locale = locale;
    });
    debugPrint('Applan:$locale');
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        context.locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    FirebaseServices().getinitialMessage();
    FirebaseServices().getonMessage();
    FirebaseServices().getonMessageOpenedApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapProvider(),
      child: MaterialApp(
        title: 'Haleemh',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        onGenerateRoute: onGenerateRoute,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: themeData,
        home: const SplashScreen(),
      ),
    );
  }
}
