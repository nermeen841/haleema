import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/presentation/screens/detail/detail.dart';
import 'package:halema/presentation/screens/layout/layout.dart';

import '../../presentation/screens/home/cubit/setter_cubit.dart';
import '../router/router.dart';

class DynamicLinkService {
  Future handleDynamicLinks() async {
    final data = await FirebaseDynamicLinks.instance.getInitialLink();
    handleDeepLink(data);
    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
    dynamicLinks.onLink.listen((dynamicLinkData) {
      final Uri uri = dynamicLinkData.link;
      final queryParams = uri.queryParameters;

      if (queryParams.isNotEmpty) {
        var id = queryParams['id'];
        if (uri.pathSegments.contains("setter")) {
          GetIt.I<SetterCubit>().getSetterDetail(int.parse(id.toString()));
          MagicRouter.navigateTo(const DetailScreen());
        } else {
          MagicRouter.navigateAndPopAll(const LayoutScreen());
        }
      } else {
        MagicRouter.navigateAndPopAll(const LayoutScreen());
        debugPrint(dynamicLinkData.link.path);
      }
    }).onError((error) {
      debugPrint(error);
    });
  }

///////////////////////////////////////////////////////////////////////////////
  void handleDeepLink(PendingDynamicLinkData? data) {
    final Uri deepLink = data!.link;
    final queryParams = deepLink.queryParameters;
    debugPrint(queryParams.toString());
    if (queryParams.isNotEmpty) {
      var id = queryParams['id'];
      if (deepLink.pathSegments.contains("setter")) {
        GetIt.I<SetterCubit>().getSetterDetail(int.parse(id.toString()));
        debugPrint(id);
        MagicRouter.navigateTo(const DetailScreen());
      } else {
        MagicRouter.navigateAndPopAll(const LayoutScreen());
        debugPrint(queryParams.toString());
      }
      debugPrint('_handleDeepLink | deeplink: $deepLink');
      debugPrint("deep link paramaters :   ${deepLink.queryParameters}");
    }
  }
  ///////////////////////////////////////////////////////////////////////

  Future<Uri> createDynamicLink(
      {required int id,
      required String type,
      String? title,
      String? image}) async {
    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://halema.page.link',
      link: Uri.parse("https://halema.page.link/u9DC/$type?id=$id"),
      socialMetaTagParameters: SocialMetaTagParameters(
          title: title ?? "", imageUrl: Uri.parse(image ?? "")),
      androidParameters: AndroidParameters(
        packageName: 'com.parent.halema',
        fallbackUrl: Uri.parse("https://halema.page.link/u9DC/$type?id=$id"),
      ),
      iosParameters: IOSParameters(
        bundleId: 'com.example.halema',
        fallbackUrl: Uri.parse("https://halema.page.link/u9DC/$type?id=$id"),
      ),
    );

    debugPrint(parameters.link.toString());
    final shortLink = await dynamicLinks.buildShortLink(
      parameters,
    );
    final Uri shortUrl = shortLink.shortUrl;
    return shortUrl;
  }
}
