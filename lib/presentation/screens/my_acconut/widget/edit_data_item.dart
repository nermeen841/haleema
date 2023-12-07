import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/space_widget.dart';

class EditDataItem extends StatelessWidget {
  final String title;
  final String icon;
  final Widget textField;
  final VoidCallback ontap;
  const EditDataItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.textField,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.02,
        horizontal: screenWidth(context) * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(icon),
              const HorizontalSpace(value: 1),
              Text(
                title,
                style: bodyStryle(
                  context: context,
                  color: colorBlack,
                ).copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const VerticalSpace(value: 3),
          textField,
          const VerticalSpace(value: 3),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: screenWidth(context) * 0.4,
                child: CustomGeneralButton(
                  text: translateString("Done", "موافق"),
                  onTap: ontap,
                ),
              ),
              SizedBox(
                width: screenWidth(context) * 0.4,
                child: CustomGeneralButton(
                  color: kMainColor.withOpacity(0.3),
                  textColor: kMainColor,
                  text: translateString("Cancel", "إلغاء"),
                  onTap: () => MagicRouter.pop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
