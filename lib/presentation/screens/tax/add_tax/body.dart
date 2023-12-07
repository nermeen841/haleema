import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:haleema/core/constants/app_icons.dart';
import 'package:haleema/core/constants/colors.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/core/constants/text_theme.dart';
import 'package:haleema/core/widgets/custom_buttons_widget.dart';
import 'package:haleema/core/widgets/space_widget.dart';

class AddTaxBody extends StatefulWidget {
  const AddTaxBody({super.key});

  @override
  State<AddTaxBody> createState() => _AddTaxBodyState();
}

class _AddTaxBodyState extends State<AddTaxBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.02,
        horizontal: screenWidth(context) * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            translateString("A copy of the tax number", "صوره الرقم الضريبي"),
            style: headingStyle2(
              context: context,
              color: colorBlack,
            ),
          ),
          const VerticalSpace(value: 2),
          InkWell(
            onTap: () => uploadImage(context),
            child: DottedBorder(
              color: kMainColor,
              strokeWidth: 1,
              child: Container(
                width: double.infinity,
                height: screenHeight(context) * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    screenWidth(context) * 0.05,
                  ),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppIcons.addImage,
                      ),
                      const VerticalSpace(value: 1),
                      Text(
                        translateString("Add A copy of the tax number",
                            "اضف صوره الرقم الضريبي"),
                        style: bodyStryle(
                          context: context,
                          color: colorGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const VerticalSpace(value: 2),
          Text(
            translateString(". upload image with extension .png or .jpj",
                ". قم برفع الصوره بأمتداد Png or jpj"),
            style: bodyStryle(
              context: context,
              color: colorLightGrey,
            ),
          ),
          const VerticalSpace(value: 1),
          Text(
            translateString(
                "- maximum 5M for image", "- حد اقصي 5 ميجا للصوره"),
            style: bodyStryle(
              context: context,
              color: colorLightGrey,
            ),
          ),
          const VerticalSpace(value: 4),
          CustomGeneralButton(
            text: translateString("Save", "حفظ"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
