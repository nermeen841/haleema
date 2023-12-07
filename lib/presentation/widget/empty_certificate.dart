import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haleema/core/constants/colors.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/core/constants/text_theme.dart';
import 'package:haleema/core/widgets/custom_buttons_widget.dart';
import 'package:haleema/core/widgets/space_widget.dart';

class EmptyCertificateItem extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback ontap;
  const EmptyCertificateItem(
      {super.key,
      required this.title,
      required this.buttonTitle,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                width: screenWidth(context) * 0.7,
                height: screenHeight(context) * 0.2,
                child: Stack(
                  children: [
                    SvgPicture.asset("assets/icons/circle.svg"),
                    SvgPicture.asset(
                      "assets/icons/search.svg",
                      width: screenWidth(context) * 0.6,
                      fit: BoxFit.contain,
                    ),
                  ],
                )),
          ),
          const VerticalSpace(value: 4),
          Text(
            title,
            style: headingStyle2(
              context: context,
              color: colorBlack,
            ),
          ),
          const VerticalSpace(value: 1.5),
          Text(
            translateString(
                "Complete the rest of your information to be able to receive requests from parents",
                "استكمل باقي بياناتك حتي تتمكن من استقبال طلباتمن الأباء"),
            textAlign: TextAlign.center,
            style: bodyStryle(
              context: context,
              color: Colors.grey,
            ),
          ),
          const VerticalSpace(value: 4),
          CustomGeneralButton(
            text: buttonTitle,
            onTap: ontap,
          ),
        ],
      ),
    );
  }
}
