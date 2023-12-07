// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/presentation/screens/messages/cubit/message_cubit.dart';
import '../../../../core/utiles/size_config.dart';
import '../../../../core/widgets/space_widget.dart';
import 'my_message.dart';
import 'reciver_message.dart';

class ChatView extends StatefulWidget {
  const ChatView({
    super.key,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessageCubit, MessageState>(
      listener: (context, state) {},
      bloc: GetIt.I<MessageCubit>(),
      builder: (context, state) {
        return (GetIt.I<MessageCubit>().messageModel != null)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        reverse: true,
                        itemBuilder: (context, index) {
                          {
                            if (GetIt.I<MessageCubit>()
                                    .messageModel!
                                    .data!
                                    .data![index]
                                    .userId ==
                                prefs.getInt('user_id')) {
                              return ChatMyMessageItem(
                                message: GetIt.I<MessageCubit>()
                                    .messageModel!
                                    .data!
                                    .data![index]
                                    .text!,
                              );
                            } else {
                              return ChatReciverMessageItem(
                                message: GetIt.I<MessageCubit>()
                                    .messageModel!
                                    .data!
                                    .data![index]
                                    .text!,
                              );
                            }
                          }
                        },
                        separatorBuilder: (context, index) =>
                            const VerticalSpace(value: 2),
                        itemCount: GetIt.I<MessageCubit>()
                            .messageModel!
                            .data!
                            .data!
                            .length,
                      ),
                    ),
                  ),
                  customTextFieldWithButtonChat(
                      GetIt.I<MessageCubit>().messageModel!.conversationId!),
                ],
              )
            : loading();
      },
    );
  }

  ///////////////////////////////////////////////////////////////////////////

  Widget customTextFieldWithButtonChat(int id) {
    TextEditingController message = TextEditingController();
    SizeConfig().init(context);
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            fillColor: textFormFieldColor,
            borderColor: Colors.transparent,
            controller: message,
            hint: translateString('write your message', "اكتب رسالتك"),
            // prefix: Icon(
            //   Icons.emoji_emotions_outlined,
            //   color: colorLightGrey,
            // ),
          ),
        ),
        const HorizontalSpace(value: 1),
        BlocConsumer<MessageCubit, MessageState>(
          listener: (context, state) {},
          bloc: GetIt.I<MessageCubit>(),
          builder: (context, state) {
            return InkWell(
              onTap: () => GetIt.I<MessageCubit>().sendMessage(
                conversationId: id,
                message: message.text,
              ),
              child: SvgPicture.asset(
                AppIcons.sendMessageCircleIcon,
              ),
            );
          },
        ),
        const HorizontalSpace(value: 0.7),
      ],
    );
  }
}
