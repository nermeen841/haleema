import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haleema/core/constants/colors.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/core/constants/text_theme.dart';
import 'package:haleema/core/router/router.dart';
import 'package:haleema/core/widgets/custom_drop_down.dart';
import 'package:haleema/core/widgets/space_widget.dart';
import 'package:haleema/presentation/screens/detail/screens/certificate/certificate.dart';
import 'package:haleema/presentation/screens/my_acconut/widget/data_item.dart';
import 'package:haleema/presentation/screens/my_acconut/widget/edit_data_item.dart';

class ExperienceBody extends StatefulWidget {
  const ExperienceBody({super.key});

  @override
  State<ExperienceBody> createState() => _ExperienceBodyState();
}

class _ExperienceBodyState extends State<ExperienceBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight(context),
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.03,
        vertical: screenHeight(context) * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(value: 10),
          DataInfoItem(
            title: translateString("Type of license", "نوع الترخيص"),
            data: "عمل حر",
            icon: "assets/icons/certificate.svg",
            ontap: () => homeBottomSheet(
              context: context,
              child: EditDataItem(
                title: translateString("Type of license", "نوع الترخيص"),
                ontap: () {},
                icon: "assets/icons/certificate.svg",
                textField: CustomGeneralDropDown(
                  fillColor: textFormFieldColor,
                  borderColor: Colors.transparent,
                  text: "عمل حر",
                ),
              ),
            ),
          ),
          const VerticalSpace(value: 4),
          InkWell(
            onTap: () => MagicRouter.navigateTo(const CertificateScreen()),
            child: Container(
              width: double.infinity,
              height: screenHeight(context) * 0.08,
              decoration: BoxDecoration(
                color: textFormFieldColor,
                borderRadius: BorderRadius.circular(
                  screenWidth(context) * 0.03,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/cer.svg"),
                      const HorizontalSpace(value: 1),
                      Text(
                        translateString("certificates", "الشهادات"),
                        style: bodyStryle(
                          context: context,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/warning-2.svg"),
                      const HorizontalSpace(value: 0.7),
                      Icon(
                        Icons.arrow_forward,
                        color: colorBlack,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
