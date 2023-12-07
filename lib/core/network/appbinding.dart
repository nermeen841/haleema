// ignore_for_file: avoid_print
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dependancy_injection.dart' as id;
import '../constants/constants.dart';

class AppBinding {
  static Future initAsyncDependebcies() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await startShared();
    await id.init();
    await initialMapMarker();
    await EasyLocalization.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
