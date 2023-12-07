import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haleema/core/constants/colors.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/core/constants/text_theme.dart';
import 'package:haleema/core/router/router.dart';
import 'package:haleema/core/widgets/custom_buttons_widget.dart';
import 'package:haleema/core/widgets/space_widget.dart';
import 'package:haleema/presentation/screens/layout/layout.dart';

class ProfileNotCopmlete extends StatelessWidget {
  const ProfileNotCopmlete({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset("assets/icons/Puzzle-01.svg"),
        ),
        const VerticalSpace(value: 2),
        Center(
          child: Text(
            translateString(
                "Complete the rest of your data", "أكمل باقي بياناتك  "),
            textAlign: TextAlign.center,
            style: headingStyle2(
              context: context,
              color: colorBlack,
            ),
          ),
        ),
        const VerticalSpace(value: 1),
        Center(
          child: Text(
            translateString("Complete the rest of your data",
                "استكمل باقي بياناتك حتي تتمكن من استقبال طلباتمن الأباء"),
            textAlign: TextAlign.center,
            style: bodyStryle2(
              context: context,
              color: Colors.grey,
            ),
          ),
        ),
        const VerticalSpace(value: 3),
        CustomGeneralButton(
          text: translateString(
              "Go to the personal page", "الأنتقال الي الصفحه الشخصيه"),
          onTap: () {
            MagicRouter.navigateAndPReplacement(
              const LayoutScreen(
                index: 3,
              ),
            );
          },
        ),
      ],
    );
  }
}
