import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/space_widget.dart';

import '../../../home/model/get_setter_detail_model.dart';
import 'room_detail.dart';

class RoomBody extends StatefulWidget {
  final List<Rooms> rooms;
  const RoomBody({super.key, required this.rooms});

  @override
  State<RoomBody> createState() => _RoomBodyState();
}

class _RoomBodyState extends State<RoomBody> {
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
          horizontal: screenWidth(context) * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                translateString("Rooms", "الغرف"),
                textAlign: TextAlign.center,
                style: headingStyle2(context: context, color: colorBlack),
              ),
            ),
            const VerticalSpace(value: 2),
            Wrap(
              runSpacing: 20,
              spacing: 15,
              children: List.generate(
                widget.rooms.length,
                (index) => InkWell(
                  onTap: () => MagicRouter.navigateTo(RommDetailScreen(
                    rooms: widget.rooms[index],
                  )),
                  child: SizedBox(
                    width: screenWidth(context) * 0.45,
                    height: screenHeight(context) * 0.25,
                    child: Column(
                      children: [
                        SizedBox(
                          width: screenWidth(context) * 0.45,
                          height: screenHeight(context) * 0.2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                screenWidth(context) * .05),
                            child: customCachedNetworkImage(
                              url: (widget.rooms[index].roomsImages!.isNotEmpty)
                                  ? widget.rooms[index].roomsImages![0].image!
                                      .imageUrl!
                                  : "",
                              context: context,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const VerticalSpace(value: 0.7),
                        Center(
                          child: Text(
                            widget.rooms[index].name!,
                            textAlign: TextAlign.center,
                            style:
                                bodyStryle(context: context, color: colorBlack),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
