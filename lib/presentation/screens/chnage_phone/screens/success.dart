import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/widgets/space_widget.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/text_theme.dart';
import '../../../../core/router/router.dart';
import '../../../../core/widgets/custom_buttons_widget.dart';
import '../../layout/layout.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarNoTitle(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppIcons.successVectorIcon),
            const VerticalSpace(value: 5),
            Text(
              translateString("phone number changed Successfully",
                  "تم تغير رقم الجوال بنجاح"),
              style: headingStyle1(
                context: context,
                color: colorBlack,
              ),
            ),
            const VerticalSpace(value: 5),
            CustomGeneralButton(
              text:
                  translateString("Back to Home", "الرجوع الي الصفحه الرئيسه"),
              onTap: () => MagicRouter.navigateAndPopAll(const LayoutScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
