import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';
import 'package:halema/presentation/screens/messages/cubit/message_cubit.dart';

import '../../../../../../core/router/router.dart';
import '../../../../detail/screens/ratting/ratting.dart';
import '../../../../messages/pages/chat_body.dart';

class ContactItem extends StatelessWidget {
  final int userId;
  final String name;
  final String image;
  const ContactItem(
      {super.key,
      required this.userId,
      required this.name,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BlocConsumer<MessageCubit, MessageState>(
          listener: (context, state) {},
          bloc: GetIt.I<MessageCubit>(),
          builder: (context, state) {
            return InkWell(
              onTap: () {
                GetIt.I<MessageCubit>().getMessages(
                  userId: userId,
                );
                MagicRouter.navigateTo(
                  ChatBodyScreen(
                    recieverName: name,
                    recieverImage: image,
                  ),
                );
              },
              child: CircleAvatar(
                radius: screenWidth(context) * 0.05,
                backgroundColor: textFormFieldColor,
                child: Center(
                  child: SvgPicture.asset(AppIcons.messageIcon),
                ),
              ),
            );
          },
        ),
        const HorizontalSpace(value: 1),
        BlocConsumer<SetterCubit, SetterState>(
          listener: (context, state) {},
          bloc: GetIt.I<SetterCubit>(),
          builder: (context, state) {
            return InkWell(
              onTap: () {
                GetIt.I<SetterCubit>().getReview(userId);
                MagicRouter.navigateTo(const RattingScreen());
              },
              child: CircleAvatar(
                radius: screenWidth(context) * 0.05,
                backgroundColor: textFormFieldColor,
                child: Center(
                  child: SvgPicture.asset(AppIcons.starIcon),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
