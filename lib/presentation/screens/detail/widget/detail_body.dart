import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/detail/screens/certificate/certificate.dart';
import 'package:halema/presentation/screens/detail/screens/ratting/ratting.dart';
import 'package:halema/presentation/screens/detail/screens/reservation/reservation.dart';
import 'package:halema/presentation/screens/detail/screens/rooms/room.dart';
import 'package:halema/presentation/screens/detail/widget/header_image.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';
import 'package:halema/presentation/screens/map/track_location.dart';
import 'package:halema/presentation/screens/messages/cubit/message_cubit.dart';
import 'package:halema/presentation/widget/detail_info.dart';
import 'package:halema/presentation/widget/detail_item.dart';

import '../../children/cubit/children_cubit.dart';
import '../../driver/cubit/driver_cubit.dart';
import '../../messages/pages/chat_body.dart';

class DetailBody extends StatefulWidget {
  const DetailBody({super.key});

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetterCubit, SetterState>(
      bloc: GetIt.I<SetterCubit>(),
      listener: (context, state) {},
      builder: (context, state) {
        return (GetIt.I<SetterCubit>().getSetterDetailModel != null)
            ? SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight(context) * 0.02,
                  horizontal: screenWidth(context) * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderImage(
                      setterId: GetIt.I<SetterCubit>()
                          .getSetterDetailModel!
                          .setter!
                          .id!,
                      rateValue: (GetIt.I<SetterCubit>()
                                  .getSetterDetailModel!
                                  .setter!
                                  .user!
                                  .avgNumOfStars !=
                              null)
                          ? double.parse(GetIt.I<SetterCubit>()
                              .getSetterDetailModel!
                              .setter!
                              .user!
                              .avgNumOfStars
                              .toString())
                          : 0.0,
                      name: GetIt.I<SetterCubit>()
                          .getSetterDetailModel!
                          .setter!
                          .user!
                          .name!,
                      numOfSesstion: GetIt.I<SetterCubit>()
                          .getSetterDetailModel!
                          .setter!
                          .completedOrders
                          .toString(),
                      image: GetIt.I<SetterCubit>()
                          .getSetterDetailModel!
                          .setter!
                          .user!
                          .imageUrl!,
                      totalRates: GetIt.I<SetterCubit>()
                          .getSetterDetailModel!
                          .setter!
                          .user!
                          .totalRates!
                          .toString(),
                    ),
                    const VerticalSpace(value: 3),
                    Wrap(
                      children: [
                        Text(
                          GetIt.I<SetterCubit>()
                                  .getSetterDetailModel!
                                  .setter!
                                  .hint ??
                              '',
                          style: bodyStryle2(
                            context: context,
                            color: colorBlack,
                          ).copyWith(height: 1.7),
                        ),
                      ],
                    ),
                    (GetIt.I<SetterCubit>()
                                .getSetterDetailModel!
                                .setter!
                                .hint !=
                            null)
                        ? const VerticalSpace(value: 3)
                        : const SizedBox(),
                    DetailItem(
                        title: translateString("Nationality", "الجنسيه"),
                        content: GetIt.I<SetterCubit>()
                                .getSetterDetailModel!
                                .setter!
                                .user!
                                .nationality ??
                            '',
                        iconImage: AppIcons.publicIcon),
                    const VerticalSpace(value: 2),
                    Divider(
                      color: colorGrey,
                    ),
                    const VerticalSpace(value: 3),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DetailItem(
                          title: translateString("Location", "موقع المنزل "),
                          content: GetIt.I<SetterCubit>()
                                  .getSetterDetailModel!
                                  .setter!
                                  .user!
                                  .address ??
                              '',
                          iconImage: AppIcons.mapIcon,
                        ),
                        SizedBox(
                          width: screenWidth(context) * 0.35,
                          height: screenHeight(context) * 0.06,
                          child: CustomGeneralButton(
                            color: kMainColor.withOpacity(0.1),
                            textColor: kMainColor,
                            iconImage: AppIcons.addressIcon,
                            text: translateString("Map", "الخريطة"),
                            onTap: () =>
                                MagicRouter.navigateTo(TrackLocationScreen(
                              setterName: GetIt.I<SetterCubit>()
                                  .getSetterDetailModel!
                                  .setter!
                                  .user!
                                  .name!,
                              latitude: double.parse(GetIt.I<SetterCubit>()
                                      .getSetterDetailModel!
                                      .setter!
                                      .lat ??
                                  "0.0"),
                              longitude: double.parse(GetIt.I<SetterCubit>()
                                      .getSetterDetailModel!
                                      .setter!
                                      .long ??
                                  "0.0"),
                            )),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpace(value: 2),
                    Divider(
                      color: colorGrey,
                    ),
                    const VerticalSpace(value: 3),
                    DetailItem(
                      title: translateString("Hour price", "سعر الساعه"),
                      content:
                          "${GetIt.I<SetterCubit>().getSetterDetailModel!.setter!.hourPrice} ريال سعودي",
                      iconImage: AppIcons.walletIcon,
                    ),
                    const VerticalSpace(value: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DetailInfoItem(
                          name: translateString("Ratting", "التقييمات"),
                          image: AppIcons.starIcon,
                          ontap: () {
                            GetIt.I<SetterCubit>().getReview(
                                GetIt.I<SetterCubit>()
                                    .getSetterDetailModel!
                                    .setter!
                                    .userId!);
                            MagicRouter.navigateTo(const RattingScreen());
                          },
                        ),
                        DetailInfoItem(
                          name: translateString("Certificate", "الشهادات"),
                          image: AppIcons.rewardIcon,
                          ontap: () => MagicRouter.navigateTo(CertificateScreen(
                            certificates: GetIt.I<SetterCubit>()
                                .getSetterDetailModel!
                                .setter!
                                .certificates!,
                          )),
                        ),
                        DetailInfoItem(
                          name: translateString("Rooms", "الغرف"),
                          image: AppIcons.roomIcon,
                          ontap: () => MagicRouter.navigateTo(RoomScreen(
                            rooms: GetIt.I<SetterCubit>()
                                .getSetterDetailModel!
                                .setter!
                                .facility![0]
                                .rooms!,
                          )),
                        ),
                        BlocConsumer<MessageCubit, MessageState>(
                          listener: (context, state) {},
                          bloc: GetIt.I<MessageCubit>(),
                          builder: (context, state) {
                            return DetailInfoItem(
                              name: translateString("Chat", "محادثه"),
                              image: AppIcons.messageIcon,
                              ontap: () {
                                GetIt.I<MessageCubit>().getMessages(
                                    userId: GetIt.I<SetterCubit>()
                                        .getSetterDetailModel!
                                        .setter!
                                        .user!
                                        .id!);
                                MagicRouter.navigateTo(ChatBodyScreen(
                                    recieverName: GetIt.I<SetterCubit>()
                                        .getSetterDetailModel!
                                        .setter!
                                        .user!
                                        .name!,
                                    recieverImage: GetIt.I<SetterCubit>()
                                        .getSetterDetailModel!
                                        .setter!
                                        .user!
                                        .imageUrl!));
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const VerticalSpace(value: 4),
                    CustomGeneralButton(
                        text: translateString("Book now", "احجز الان"),
                        onTap: () {
                          GetIt.I<ChildrenCubit>().getchildren();
                          GetIt.I<DriverCubit>().getDrivers();
                          MagicRouter.navigateTo(ReservationScreen(
                            hourPrice: GetIt.I<SetterCubit>()
                                .getSetterDetailModel!
                                .setter!
                                .hourPrice!,
                            setterId: GetIt.I<SetterCubit>()
                                .getSetterDetailModel!
                                .setter!
                                .id!,
                          ));
                        }),
                  ],
                ),
              )
            : loading();
      },
    );
  }
}
