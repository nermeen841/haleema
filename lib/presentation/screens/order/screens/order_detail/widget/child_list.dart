import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/order/model/all_orders.dart';
import 'package:halema/presentation/widget/child_order_card.dart';

class ChildrenOrderList extends StatefulWidget {
  static bool showButton = false;
  final List<Children> children;
  const ChildrenOrderList({super.key, required this.children});

  @override
  State<ChildrenOrderList> createState() => _ChildrenOrderListState();
}

class _ChildrenOrderListState extends State<ChildrenOrderList> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpace(value: 2),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${translateString("children", "الأطفال")} ",
                style: headingStyle2(
                  context: context,
                  color: colorBlack,
                ),
              ),
              TextSpan(
                text: "(${widget.children.length})",
                style: headingStyle2(
                  context: context,
                  color: kMainColor,
                ),
              ),
            ],
          ),
        ),
        const VerticalSpace(value: 1),
        (widget.children.isNotEmpty)
            ? InkWell(
                onTap: () {
                  if (currentPage != widget.children.length - 1) {
                    setState(() {
                      currentPage++;
                      ChildrenOrderList.showButton = true;
                    });
                  } else {
                    setState(() {
                      currentPage = 0;
                      ChildrenOrderList.showButton = false;
                    });
                  }
                },
                child: ChildOrderCard(
                  name: widget.children[currentPage].name!,
                  image: widget.children[currentPage].imageUrl!,
                  age: widget.children[currentPage].age ?? "",
                  hobby: widget.children[currentPage].hobby ?? "",
                  disease: widget.children[currentPage].disease ?? "",
                  not: widget.children[currentPage].note ?? "",
                ),
              )
            : const SizedBox(),
        const VerticalSpace(value: 0.7),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.children.length,
              (index) => buildOnBoardingDot(index: index, context: context)),
        ),
      ],
    );
  }

  /////////////////////////////////////////////////////////////////////
  Container buildOnBoardingDot({required int index, required context}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == index ? kMainColor : const Color(0xffA2AABD),
      ),
    );
  }
}
