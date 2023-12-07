import 'package:flutter/material.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/layout/layout.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';

class AddBalanceSuccessBody extends StatelessWidget {
  const AddBalanceSuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.04,
        horizontal: screenWidth(context) * 0.03,
      ),
      margin: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.04,
        horizontal: screenWidth(context) * 0.04,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          screenWidth(context) * 0.04,
        ),
        boxShadow: [
          BoxShadow(
            color: colorLightGrey.withOpacity(0.2),
            offset: const Offset(0, 2),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: screenWidth(context) * 0.08,
            backgroundColor: kMainColor.withOpacity(0.3),
            child: Center(
              child: Image.asset(AppIcons.redCheckIcon),
            ),
          ),
          const VerticalSpace(value: 1),
          Text(
            translateString("Done successfully", "تم بنجاح"),
            style: headingStyle1(
              context: context,
              color: colorBlack,
            ),
          ),
          const VerticalSpace(value: 1),
          Text(
            translateString("The balance has been added successfully",
                "تم أضافه الرصيد بنجاح"),
            style: bodyStryle(
              context: context,
              color: colorGrey.withOpacity(0.5),
            ),
          ),
          const VerticalSpace(value: 3),
          Container(
            width: double.infinity,
            height: screenHeight(context) * 0.1,
            decoration: BoxDecoration(
              color: textFormFieldColor,
              borderRadius: BorderRadius.circular(
                screenWidth(context) * 0.03,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: " 1200 ",
                        style: headingStyle1(
                          context: context,
                          color: colorBlack,
                        ),
                      ),
                      TextSpan(
                        text: translateString("R.S", "ر.س"),
                        style: bodyStryle(
                          context: context,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(value: 1),
                Text(
                  translateString("added balance", "الرصيد المضاف"),
                  style: bodyStryle(
                    context: context,
                    color: colorGrey,
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpace(value: 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    translateString("From", "من"),
                    style: headingStyle2(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                  Text(
                    "مريم طارق",
                    style: headingStyle2(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(value: 1),
              Text(
                "Visa 7889*",
                textAlign: TextAlign.start,
                style: bodyStryle(
                  context: context,
                  color: colorGrey,
                ),
              ),
              const VerticalSpace(value: 2),
              Divider(
                color: colorGrey,
              ),
              const VerticalSpace(value: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    translateString("To", "إلي"),
                    style: headingStyle2(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                  Text(
                    "مريم طارق",
                    style: headingStyle2(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(value: 1),
              Text(
                "محفظه تطبيق حليمه",
                textAlign: TextAlign.start,
                style: bodyStryle(
                  context: context,
                  color: colorGrey,
                ),
              ),
              const VerticalSpace(value: 2),
              Divider(
                color: colorGrey,
              ),
              const VerticalSpace(value: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    translateString("Date", "تاريخ"),
                    style: headingStyle2(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                  Text(
                    "26 Apr 2023",
                    style: headingStyle2(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(value: 1),
              Text(
                "12:48 PM",
                textAlign: TextAlign.start,
                style: bodyStryle(
                  context: context,
                  color: colorGrey,
                ),
              ),
              const VerticalSpace(value: 4),
              CustomGeneralButton(
                text: translateString("Done", "تم"),
                onTap: () =>
                    MagicRouter.navigateAndPopAll(const LayoutScreen()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
