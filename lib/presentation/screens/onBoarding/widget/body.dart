import 'package:flutter/material.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/auth/login/login.dart';
import 'package:halema/presentation/screens/onBoarding/widget/content.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
  List<String> icons = [
    AppIcons.onboardingVector3,
    AppIcons.onboardingVector,
    AppIcons.onboardingVector2,
  ];

  List<String> title = [
    "مرحبا بك في تطبيق حليمه",
    "سجل و أملىء بياناتك",
    "أعثر على أفضل جليسة أطفال و حضانة ",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: screenHeight(context) * 0.65,
          child: PageView.builder(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: icons.length,
            itemBuilder: (context, index) => OnBoardingContent(
              image: icons[index],
              title: title[index],
              text:
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد ",
            ),
          ),
        ),
        SizedBox(height: screenHeight(context) * 0.035),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => buildOnBoardingDot(
                index: index, currentPage: currentPage, context: context),
          ),
        ),
        const VerticalSpace(value: 4.5),
        InkWell(
          onTap: () async {
            if (currentPage != 2) {
              setState(() {
                currentPage = currentPage;
              });
              pageController.animateToPage(currentPage + 1,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.fastLinearToSlowEaseIn);
            } else {
              prefs.setBool('is_onboearding', true);
              MagicRouter.navigateAndPopAll(const LoginScreen());
            }
          },
          child: Image.asset(AppIcons.arrowLeft),
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////
Container buildOnBoardingDot(
    {required int index, required int currentPage, required context}) {
  return Container(
    margin: const EdgeInsets.all(3),
    height: (currentPage == index) ? 6 : 8,
    width: currentPage == index ? screenWidth(context) * 0.06 : 8,
    decoration: BoxDecoration(
      borderRadius: currentPage == index
          ? BorderRadius.circular(10)
          : BorderRadius.circular(30),
      color: currentPage == index ? kMainColor : const Color(0xffA2AABD),
    ),
  );
}
