import 'package:flutter/material.dart';
import 'package:haleema/core/constants/app_icons.dart';
import 'package:haleema/core/constants/colors.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/core/constants/text_theme.dart';
import 'package:haleema/core/router/router.dart';
import 'package:haleema/core/widgets/custom_buttons_widget.dart';
import 'package:haleema/core/widgets/space_widget.dart';
import 'package:haleema/presentation/screens/detail/screens/add_certificate/add_certificate.dart';

class CertificateDetailBody extends StatefulWidget {
  const CertificateDetailBody({super.key});

  @override
  State<CertificateDetailBody> createState() => _CertificateDetailBodyState();
}

class _CertificateDetailBodyState extends State<CertificateDetailBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.03,
        horizontal: screenWidth(context) * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: screenHeight(context) * 0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                screenWidth(context) * 0.05,
              ),
              child: Image.asset(
                AppIcons.certificateImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const VerticalSpace(value: 3),
          CustomGeneralButton(
            text: translateString("Edit", "تعديل"),
            onTap: () => MagicRouter.navigateTo(
              const AddCertificateScreen(edit: true),
            ),
          ),
          const VerticalSpace(value: 2),
          CustomGeneralButton(
            text: translateString("Delete", "حذف"),
            color: kMainColor.withOpacity(0.1),
            textColor: kMainColor,
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(screenWidth(context) * 0.05),
                  ),
                ),
                title: Center(
                  child: Text(
                    translateString("Delete certificate", "حذف الشهاده"),
                    style: headingStyle2(
                      context: context,
                      color: colorRed,
                    ),
                  ),
                ),
                content: Text(
                  translateString("Are you sure to delete certificate ?",
                      "هل انت متأكدمن حذف الشهاده ؟ "),
                  style: bodyStryle(context: context, color: colorBlack),
                ),
                actions: [
                  SizedBox(
                    width: screenWidth(context) * 0.4,
                    child: CustomGeneralButton(
                      text: translateString("ok", "موافق"),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    width: screenWidth(context) * 0.4,
                    child: CustomGeneralButton(
                      color: kMainColor.withOpacity(0.1),
                      textColor: kMainColor,
                      text: translateString("cancel", "إلغاء"),
                      onTap: () => MagicRouter.pop(),
                    ),
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
