import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/helper/functions/show_toast.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/support/cubit/support_cubit.dart';
import 'package:halema/presentation/screens/support/widget/support_widget.dart';
import 'package:halema/presentation/screens/support/widget/thread-card.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/router/router.dart';
import '../../../../core/widgets/custom_buttons_widget.dart';
import '../../../../generator/locale_keys.dart';
import 'chat_body.dart';

bool sendMessage = false;
bool showSupport = false;

class SupportBody extends StatefulWidget {
  const SupportBody({super.key});

  @override
  State<SupportBody> createState() => _SupportBodyState();
}

class _SupportBodyState extends State<SupportBody> {
  TextEditingController message = TextEditingController();
  TextEditingController problem = TextEditingController();
  List<String> options = [
    translateString("Baby Setter", "مربية"),
    translateString("Something else", "سبب اخر"),
  ];

  int? selectedID;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SupportCubit, SupportState>(
      listener: (context, state) {},
      bloc: GetIt.I<SupportCubit>(),
      builder: (context, state) {
        return (GetIt.I<SupportCubit>().ticketWithThreadModel == null)
            ? loading()
            : (GetIt.I<SupportCubit>()
                        .ticketWithThreadModel!
                        .tickets!
                        .isNotEmpty &&
                    showSupport == false)
                ? Column(
                    children: [
                      ListView.separated(
                          shrinkWrap: true,
                          primary: true,
                          padding: EdgeInsets.symmetric(
                            vertical: screenWidth(context) * 0.02,
                            horizontal: screenWidth(context) * 0.03,
                          ),
                          itemBuilder: (context, index) => InkWell(
                                onTap: () => setState(() {
                                  selectedID = GetIt.I<SupportCubit>()
                                      .ticketWithThreadModel!
                                      .tickets![index]
                                      .id;
                                  selectedIndex = index;
                                }),
                                child: ThreadCard(
                                  borderColor: (selectedID ==
                                          GetIt.I<SupportCubit>()
                                              .ticketWithThreadModel!
                                              .tickets![index]
                                              .id)
                                      ? kMainColor
                                      : null,
                                  date: DateFormat('EEEE,  d MMM yyyy').format(
                                    DateTime.parse(GetIt.I<SupportCubit>()
                                        .ticketWithThreadModel!
                                        .tickets![index]
                                        .createdAt!),
                                  ),
                                  title: GetIt.I<SupportCubit>()
                                      .ticketWithThreadModel!
                                      .tickets![index]
                                      .problem!,
                                  subtitle: GetIt.I<SupportCubit>()
                                      .ticketWithThreadModel!
                                      .tickets![index]
                                      .description!,
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              const VerticalSpace(value: 1),
                          itemCount: GetIt.I<SupportCubit>()
                              .ticketWithThreadModel!
                              .tickets!
                              .length),
                      const VerticalSpace(value: 2),
                      SizedBox(
                        width: screenWidth(context) * 0.9,
                        child: CustomGeneralButton(
                            text: translateString("Chat", "المحادثة"),
                            color: kMainColor.withOpacity(0.1),
                            textColor: kMainColor,
                            iconImage: AppIcons.messageIcon,
                            onTap: () {
                              if (selectedID != null) {
                                GetIt.I<SupportCubit>()
                                    .getReportMessages(selectedID!);
                                MagicRouter.navigateTo(SupportChatBody(
                                  id: selectedID!,
                                ));
                              } else {
                                showToast(
                                    msg: translateString('Must Select Complan',
                                        'يجب اختيار الشكوي'),
                                    state: ToastStates.ERROR);
                              }
                            }),
                      ),
                      const VerticalSpace(value: 2),
                      SizedBox(
                        width: screenWidth(context) * 0.9,
                        child: CustomGeneralButton(
                          text: LocaleKeys.SEND.tr(),
                          onTap: () => setState(() {
                            showSupport = true;
                          }),
                        ),
                      ),
                    ],
                  )
                : SupportWidget(
                    options: options,
                    message: message,
                    problem: problem,
                  );
      },
    );
  }
}
