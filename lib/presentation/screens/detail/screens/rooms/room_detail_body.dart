import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

import '../../../home/model/get_setter_detail_model.dart';

class RoomDetailBody extends StatefulWidget {
  final Rooms rooms;
  const RoomDetailBody({super.key, required this.rooms});

  @override
  State<RoomDetailBody> createState() => _RoomDetailBodyState();
}

class _RoomDetailBodyState extends State<RoomDetailBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            screenWidth(context) * 0.08,
          ),
          topRight: Radius.circular(
            screenWidth(context) * 0.08,
          ),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight(context) * 0.02,
          horizontal: screenWidth(context) * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                widget.rooms.name!,
                textAlign: TextAlign.center,
                style: headingStyle2(context: context, color: colorBlack),
              ),
            ),
            const VerticalSpace(value: 2),
            ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) => SizedBox(
                width: double.infinity,
                height: screenHeight(context) * 0.4,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(screenWidth(context) * .06),
                  child: customCachedNetworkImage(
                    url: widget.rooms.roomsImages![index].image!.imageUrl!,
                    fit: BoxFit.cover,
                    context: context,
                  ),
                ),
              ),
              separatorBuilder: (context, index) =>
                  const VerticalSpace(value: 2),
              itemCount: widget.rooms.roomsImages!.length,
            ),
          ],
        ),
      ),
    );
  }
}
