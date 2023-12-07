import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/presentation/screens/driver/cubit/driver_cubit.dart';
import 'package:image_picker/image_picker.dart';

import 'widget/body.dart';

class DriverDetailScreen extends StatefulWidget {
  const DriverDetailScreen({super.key});

  @override
  State<DriverDetailScreen> createState() => _DriverDetailScreenState();
}

class _DriverDetailScreenState extends State<DriverDetailScreen> {
  File? profileImage;
  String? profileImageApi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarNoTitle(),
      body: BlocConsumer<DriverCubit, DriverState>(
        listener: (context, state) {},
        bloc: GetIt.I<DriverCubit>(),
        builder: (context, state) {
          return (GetIt.I<DriverCubit>().driverDetailModel != null)
              ? Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Scaffold(
                      appBar: customAppbar(
                        title: "",
                        context: context,
                        actions: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          screenWidth(context) * 0.05),
                                    ),
                                  ),
                                  title: Center(
                                    child: Text(
                                      translateString(
                                          "Delete driver", "حذف السائق"),
                                      style: headingStyle2(
                                        context: context,
                                        color: colorRed,
                                      ),
                                    ),
                                  ),
                                  content: Text(
                                    translateString(
                                        "Are you sure to delete the driver?",
                                        "هل انت متأكدمن حذف السائق ؟ "),
                                    style: bodyStryle(
                                        context: context, color: colorBlack),
                                  ),
                                  actions: [
                                    BlocConsumer<DriverCubit, DriverState>(
                                      listener: (context, state) {},
                                      bloc: GetIt.I<DriverCubit>(),
                                      builder: (context, state) {
                                        return SizedBox(
                                          width: screenWidth(context) * 0.4,
                                          child: (state
                                                  is! DeleteDriverLoadingState)
                                              ? CustomGeneralButton(
                                                  text: translateString(
                                                      "ok", "موافق"),
                                                  onTap: () => GetIt.I<
                                                          DriverCubit>()
                                                      .deleteDriver(GetIt.I<
                                                              DriverCubit>()
                                                          .driverDetailModel!
                                                          .driverDetails!
                                                          .id!),
                                                )
                                              : loading(),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: screenWidth(context) * 0.4,
                                      child: CustomGeneralButton(
                                        color: kMainColor.withOpacity(0.1),
                                        textColor: kMainColor,
                                        text:
                                            translateString("cancel", "إلغاء"),
                                        onTap: () => MagicRouter.pop(),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.delete_forever,
                              color: colorRed,
                            ),
                          ),
                        ],
                      ),
                      body: const DriverDetailBody(),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.17,
                      width: screenWidth(context) * 0.4,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Center(
                            child: (profileImage != null)
                                ? CircleAvatar(
                                    radius: screenWidth(context) * 0.15,
                                    backgroundColor: kMainColor,
                                    backgroundImage: FileImage(profileImage!))
                                : CircleAvatar(
                                    radius: screenWidth(context) * 0.15,
                                    backgroundColor: kMainColor,
                                    backgroundImage: NetworkImage(
                                        GetIt.I<DriverCubit>()
                                            .driverDetailModel!
                                            .driverDetails!
                                            .imageUrl!),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                uploadImage(
                                  context: context,
                                  ontapGallery: () async {
                                    final ImagePicker picker = ImagePicker();

                                    final image = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    if (image != null) {
                                      setState(() {
                                        profileImage = File(image.path);
                                        profileImageApi = image.path;
                                      });
                                      GetIt.I<DriverCubit>().editDriver(
                                          id: GetIt.I<DriverCubit>()
                                              .driverDetailModel!
                                              .driverDetails!
                                              .id!,
                                          image: MultipartFile.fromFileSync(
                                              profileImageApi!));
                                    }
                                    MagicRouter.pop();
                                  },
                                  ontapCamera: () async {
                                    final ImagePicker picker = ImagePicker();

                                    final image = await picker.pickImage(
                                        source: ImageSource.camera);
                                    if (image != null) {
                                      setState(() {
                                        profileImage = File(image.path);
                                        profileImageApi = image.path;
                                      });
                                      GetIt.I<DriverCubit>().editDriver(
                                          id: GetIt.I<DriverCubit>()
                                              .driverDetailModel!
                                              .driverDetails!
                                              .id!,
                                          image: MultipartFile.fromFileSync(
                                              profileImageApi!));
                                    }
                                    MagicRouter.pop();
                                  },
                                );
                              },
                              child: CircleAvatar(
                                radius: screenWidth(context) * 0.05,
                                backgroundColor: kMainColor,
                                child: const Center(
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : loading();
        },
      ),
    );
  }
}
