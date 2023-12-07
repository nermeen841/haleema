import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/detail/screens/payment/widget/reciept.dart';

class DriverOrderItem extends StatelessWidget {
  final String name;
  final String phone;
  final String image;
  final String days;
  final String hours;
  final String children;
  final String hourPrice;
  const DriverOrderItem(
      {super.key,
      required this.name,
      required this.phone,
      required this.image,
      required this.days,
      required this.hours,
      required this.children,
      required this.hourPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpace(value: 1),
        Text(
          translateString("Driver", "السائق"),
          style: headingStyle2(
            context: context,
            color: colorBlack,
          ),
        ),
        const VerticalSpace(value: 1),
        Container(
          width: screenWidth(context),
          height: screenHeight(context) * 0.15,
          padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.02,
            horizontal: screenWidth(context) * 0.02,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              screenWidth(context) * 0.03,
            ),
            color: textFormFieldColor,
          ),
          child: Row(
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/call-calling.svg",
                      ),
                      const HorizontalSpace(value: 1),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: translateString(
                                  "phone number : ", "رقم الجوال : "),
                              style: bodyStryle2(
                                  context: context, color: colorGrey),
                            ),
                            TextSpan(
                              text: phone,
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
            ],
          ),
        ),
        const VerticalSpace(value: 2),
        Text(
          translateString("Reciept detail", "ملخص الفاتوره"),
          style: headingStyle2(context: context, color: colorBlack),
        ),
        const VerticalSpace(value: 1),
        RecieptItem(
          children: children,
          hourPrice: hourPrice,
          hours: hours,
          days: days,
        ),
        const VerticalSpace(value: 2),
      ],
    );
  }
}
