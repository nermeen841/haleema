import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class DataInfoItem extends StatelessWidget {
  final String title;
  final String data;
  final String icon;
  final VoidCallback ontap;
  final Color? color;
  const DataInfoItem(
      {super.key,
      required this.title,
      required this.data,
      required this.icon,
      required this.ontap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              icon,
              color: color,
            ),
            const HorizontalSpace(value: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: bodyStryle(
                    context: context,
                    color: colorGrey,
                  ),
                ),
                const VerticalSpace(value: 0.7),
                SizedBox(
                  width: screenWidth(context) * 0.7,
                  child: Text(
                    data,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                    style: bodyStryle(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        InkWell(
          onTap: ontap,
          child: SvgPicture.asset(
            AppIcons.editButton,
          ),
        ),
      ],
    );
  }
}
