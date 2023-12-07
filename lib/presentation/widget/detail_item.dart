import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class DetailItem extends StatelessWidget {
  final String title;
  final String content;
  final String iconImage;
  const DetailItem(
      {super.key,
      required this.title,
      required this.content,
      required this.iconImage});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          iconImage,
          color: colorGrey,
        ),
        const HorizontalSpace(value: 0.7),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: bodyStryle2(context: context, color: colorGrey),
            ),
            const VerticalSpace(value: 1),
            SizedBox(
              width: screenWidth(context) * 0.53,
              child: Text(
                content,
                maxLines: 3,
                overflow: TextOverflow.visible,
                style: bodyStryle(context: context, color: colorBlack),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
