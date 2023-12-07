import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class ChildDriverCard extends StatelessWidget {
  final String name;
  final String date;
  final String image;
  final VoidCallback ontap;
  const ChildDriverCard(
      {super.key,
      required this.name,
      required this.date,
      required this.image,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: screenHeight(context) * 0.17,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: colorLightGrey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(
            screenWidth(context) * 0.04,
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: screenHeight(context) * 0.02,
          horizontal: screenWidth(context) * 0.03,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth(context) * 0.25,
              height: screenHeight(context) * 0.15,
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
                  date,
                  style: bodyStryle(
                    context: context,
                    color: colorGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
