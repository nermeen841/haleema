import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class RattingCardItem extends StatelessWidget {
  final double rateValue;
  final String review;
  final String date;
  final String userNmae;
  const RattingCardItem(
      {super.key,
      required this.rateValue,
      required this.review,
      required this.date,
      required this.userNmae});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.02,
        horizontal: screenWidth(context) * 0.03,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          screenWidth(context) * 0.04,
        ),
        border: Border.all(
          color: colorGrey.withOpacity(0.1),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userNmae,
                style: bodyStryle(
                  context: context,
                  color: colorBlack,
                ),
              ),
              Row(
                children: [
                  Text(
                    rateValue.toString(),
                    style: bodyStryle2(context: context, color: colorBlack),
                  ),
                  const HorizontalSpace(value: .5),
                  RatingBar(
                    ignoreGestures: true,
                    allowHalfRating: true,
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      half: const Icon(
                        Icons.star_half,
                        color: Colors.amber,
                      ),
                      empty: const Icon(
                        Icons.star_outline,
                        color: Colors.amber,
                      ),
                    ),
                    initialRating: rateValue,
                    itemCount: 5,
                    itemSize: screenWidth(context) * 0.03,
                    onRatingUpdate: (double value) {},
                  ),
                ],
              ),
            ],
          ),
          const VerticalSpace(value: 2),
          SizedBox(
            width: screenWidth(context) * 0.8,
            child: Text(
              review,
              maxLines: 3,
              overflow: TextOverflow.visible,
              style: bodyStryle2(
                context: context,
                color: colorGrey,
              ),
            ),
          ),
          const VerticalSpace(value: 3),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              date,
              style: bodyStryle3(context: context, color: colorGrey),
            ),
          ),
        ],
      ),
    );
  }
}
