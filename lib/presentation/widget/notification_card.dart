import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/widgets/space_widget.dart';

class NotificationCardItem extends StatelessWidget {
  final String title;
  final String body;
  final String createAt;
  final int id;
  const NotificationCardItem(
      {super.key,
      required this.title,
      required this.body,
      required this.id,
      required this.createAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.02,
        horizontal: screenWidth(context) * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          screenWidth(context) * 0.04,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            offset: const Offset(0, 2),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppIcons.notifyIcon,
                color: kMainColor,
              ),
              const HorizontalSpace(value: 1),
              Text(
                title,
                style: headingStyle3(context: context, color: colorBlack),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HorizontalSpace(value: 4),
              SizedBox(
                width: screenWidth(context) * 0.8,
                child: Text(
                  body,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  style: bodyStryle2(
                    context: context,
                    color: colorGrey,
                  ),
                ),
              ),
            ],
          ),
          const VerticalSpace(value: 1),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              DateFormat('EEEE,  d MMM yyyy', prefs.getString("lang") ?? "ar")
                  .format(DateTime.parse(createAt)),
              style: bodyStryle3(context: context, color: colorGrey),
            ),
          ),
        ],
      ),
    );
  }
}
