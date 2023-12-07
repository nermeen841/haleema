import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/messages/cubit/message_cubit.dart';
import 'package:halema/presentation/screens/messages/pages/chat_body.dart';
import 'package:halema/presentation/widget/empty_item.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessageCubit, MessageState>(
      listener: (context, state) {},
      bloc: GetIt.I<MessageCubit>(),
      builder: (context, state) {
        return (GetIt.I<MessageCubit>().conversationModel!.data!.isNotEmpty)
            ? ListView.separated(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context) * 0.04,
                  vertical: screenHeight(context) * 0.02,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    GetIt.I<MessageCubit>().getMessages(
                        conversationId: GetIt.I<MessageCubit>()
                            .conversationModel!
                            .data![index]
                            .id!);
                    MagicRouter.navigateTo(
                      ChatBodyScreen(
                        recieverName: GetIt.I<MessageCubit>()
                            .conversationModel!
                            .data![index]
                            .user!
                            .name!,
                        recieverImage: GetIt.I<MessageCubit>()
                            .conversationModel!
                            .data![index]
                            .user!
                            .imageUrl!,
                      ),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: screenWidth(context) * 0.08,
                            backgroundImage: NetworkImage(
                              GetIt.I<MessageCubit>()
                                  .conversationModel!
                                  .data![index]
                                  .user!
                                  .imageUrl!,
                            ),
                          ),
                          const HorizontalSpace(value: 1),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                GetIt.I<MessageCubit>()
                                    .conversationModel!
                                    .data![index]
                                    .user!
                                    .name!,
                                style: headingStyle1(
                                  context: context,
                                  color: colorBlack,
                                ),
                              ),
                              const VerticalSpace(value: 0.7),
                              Text(
                                (GetIt.I<MessageCubit>()
                                            .conversationModel!
                                            .data![index]
                                            .lastMessage !=
                                        null)
                                    ? GetIt.I<MessageCubit>()
                                        .conversationModel!
                                        .data![index]
                                        .lastMessage!
                                        .text!
                                    : "",
                                style: bodyStryle2(
                                    context: context, color: colorGrey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (GetIt.I<MessageCubit>()
                                        .conversationModel!
                                        .data![index]
                                        .lastMessage !=
                                    null)
                                ? DateFormat("hh:mm a").format(
                                    DateTime.parse(GetIt.I<MessageCubit>()
                                        .conversationModel!
                                        .data![index]
                                        .lastMessage!
                                        .createdAt!),
                                  )
                                : "",
                            style:
                                bodyStryle2(context: context, color: colorGrey),
                          ),
                          const VerticalSpace(value: 0.7),
                          (GetIt.I<MessageCubit>()
                                          .conversationModel!
                                          .data![index]
                                          .unreadCount !=
                                      0 &&
                                  GetIt.I<MessageCubit>()
                                          .conversationModel!
                                          .data![index]
                                          .unreadCount !=
                                      null)
                              ? CircleAvatar(
                                  radius: screenWidth(context) * 0.03,
                                  backgroundColor: kMainColor,
                                  child: Center(
                                    child: Text(
                                      GetIt.I<MessageCubit>()
                                          .conversationModel!
                                          .data![index]
                                          .unreadCount
                                          .toString(),
                                      style: bodyStryle2(
                                          context: context,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      )
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const VerticalSpace(
                  value: 3,
                ),
                itemCount:
                    GetIt.I<MessageCubit>().conversationModel!.data!.length,
              )
            : EmptyItem(
                image: AppIcons.emptyOrdersIcon,
                title: translateString(
                    "no conversations here yet", "لا توجد محادثات هنا بعد"),
                content: "",
              );
      },
    );
  }
}
