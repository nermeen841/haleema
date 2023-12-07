import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class ChildOrderCard extends StatelessWidget {
  final String name;
  final String hobby;
  final String disease;
  final String not;
  final String image;
  final String age;

  const ChildOrderCard(
      {super.key,
      required this.name,
      required this.hobby,
      required this.disease,
      required this.not,
      required this.image,
      required this.age});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight(context) * 0.27,
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.02,
        horizontal: screenWidth(context) * 0.02,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          screenWidth(context) * 0.03,
        ),
        color: textFormFieldColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: screenWidth(context) * 0.2,
                height: screenHeight(context) * 0.1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    screenWidth(context) * 0.03,
                  ),
                  child: customCachedNetworkImage(
                    url: image,
                    context: context,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const HorizontalSpace(value: 1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: bodyStryle(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                  const VerticalSpace(value: 1),
                  Text(
                    translateString("$age years", "$age سنوات"),
                    style: bodyStryle(
                      context: context,
                      color: kMainColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const VerticalSpace(value: 1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AppIcons.hoppyIcon),
              const HorizontalSpace(value: 0.7),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: translateString("Hoppy : ", "الهوايه : "),
                      style: bodyStryle2(context: context, color: colorGrey),
                    ),
                    TextSpan(
                      text: hobby,
                      style: bodyStryle2(
                        context: context,
                        color: colorBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const VerticalSpace(value: 1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AppIcons.diseaseIcon),
              const HorizontalSpace(value: 0.7),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: translateString("Diseases: ", "الأمراض : "),
                      style: bodyStryle2(context: context, color: colorGrey),
                    ),
                    TextSpan(
                      text: disease,
                      style: bodyStryle2(
                        context: context,
                        color: colorBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const VerticalSpace(value: 1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AppIcons.noteIcon),
              const HorizontalSpace(value: 0.7),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: translateString("note: ", "ملاحظات : "),
                      style: bodyStryle2(context: context, color: colorGrey),
                    ),
                    TextSpan(
                      text: not,
                      style: bodyStryle2(
                        context: context,
                        color: colorBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
