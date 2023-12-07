import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class FinanceOperationItem extends StatelessWidget {
  final int id;
  final String type;
  final String amount;
  final String createAt;

  const FinanceOperationItem(
      {super.key,
      required this.id,
      required this.type,
      required this.amount,
      required this.createAt});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: screenWidth(context) * 0.08,
              backgroundColor: (type != 'credit')
                  ? kMainColor.withOpacity(0.3)
                  : colorLightGreen.withOpacity(0.2),
              child: Center(
                child: SvgPicture.asset(
                  (type != 'credit')
                      ? AppIcons.sendMoneyIcon
                      : AppIcons.recievedMoneyIcon,
                  color: (type != 'credit') ? kMainColor : colorLightGreen,
                ),
              ),
            ),
            const HorizontalSpace(value: 0.7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (type != 'credit') ? "دفع طلب" : "أضافه رصيد",
                  style: headingStyle3(
                    context: context,
                    color: colorBlack,
                  ),
                ),
                const VerticalSpace(value: 0.7),
                Text(
                  "#$id",
                  style: bodyStryle(
                    context: context,
                    color: colorGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (type != 'credit') ? "- $amount ر.س" : "+ $amount ر.س",
              style: headingStyle3(
                context: context,
                color: (type != 'credit') ? colorRed : colorGreen,
              ),
            ),
            const VerticalSpace(value: 0.7),
            Text(
              DateFormat('EEEE,  d MMM yyyy').format(DateTime.parse(createAt)),
              style: bodyStryle(
                context: context,
                color: colorGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
