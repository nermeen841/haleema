import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/utiles/size_config.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/support/cubit/support_cubit.dart';
import 'package:halema/presentation/screens/support/widget/sender.dart';

import 'reciver.dart';

class SupportChatBody extends StatefulWidget {
  const SupportChatBody({super.key, required this.id});
  final int id;
  // final List<TicketThreads> ticketThreads;
  @override
  State<SupportChatBody> createState() => _SupportChatBodyState();
}

class _SupportChatBodyState extends State<SupportChatBody> {
  TextEditingController send = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: translateString("Support and assistance", "الدعم و المساعده"),
          context: context),
      body: BlocConsumer<SupportCubit, SupportState>(
        bloc: GetIt.I<SupportCubit>(),
        listener: (context, state) {},
        builder: (context, state) {
          return (GetIt.I<SupportCubit>().reportMessageModel != null)
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
                              if (GetIt.I<SupportCubit>()
                                      .reportMessageModel!
                                      .ticketThreads![index]
                                      .userId ==
                                  prefs.getInt('user_id')) {
                                return MyMessages(
                                    message: GetIt.I<SupportCubit>()
                                        .reportMessageModel!
                                        .ticketThreads![index]
                                        .message!);
                              } else {
                                return RecieverMessage(
                                    message: GetIt.I<SupportCubit>()
                                        .reportMessageModel!
                                        .ticketThreads![index]
                                        .message!);
                              }
                            }
                          },
                          separatorBuilder: (context, index) =>
                              const VerticalSpace(value: 2),
                          itemCount: GetIt.I<SupportCubit>()
                              .reportMessageModel!
                              .ticketThreads!
                              .length,
                        ),
                      ),
                    ),
                    customTextFieldWithButtonChat(),
                  ],
                )
              : loading();
        },
      ),
    );
  }

  //////////////////////////////////////////////////////////////////////////////
  Widget customTextFieldWithButtonChat() {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              minLines: 1,
              maxLines: 5,
              controller: send,
              onChanged: (value) {},
              decoration: InputDecoration(
                fillColor: textFormFieldColor,
                filled: true,
                // prefixIcon: Icon(
                //   Icons.emoji_emotions_outlined,
                //   color: colorGrey,
                // ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: InputBorder.none,
                hintText: translateString('write your message', "اكتب رسالتك"),
                hintStyle: bodyStryle(context: context, color: colorGrey),
              ),
            ),
          ),
          BlocConsumer<SupportCubit, SupportState>(
            bloc: GetIt.I<SupportCubit>(),
            listener: (context, state) {
              if (state is MakeTicketThreadSuccessState ||
                  state is MakeTicketThreadErrorState) {
                send.clear();
              }
            },
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  GetIt.I<SupportCubit>()
                      .makeTicketThread(widget.id, send.text);
                },
                child: SvgPicture.asset(AppIcons.sendMessageIcon),
              );
            },
          ),
        ],
      ),
    );
  }
}
