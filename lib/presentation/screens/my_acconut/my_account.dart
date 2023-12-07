import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:image_picker/image_picker.dart';

import 'widget/body.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  File? profileImage;
  String? profileImageApi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarNoTitle(),
      body: BlocConsumer<AuthCubit, AuthState>(
        bloc: GetIt.I<AuthCubit>(),
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Scaffold(
                appBar: customAppbar(title: "", context: context),
                body: const MyAccountBody(),
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
                              backgroundImage: NetworkImage(GetIt.I<AuthCubit>()
                                  .profileModel!
                                  .user!
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
                                GetIt.I<AuthCubit>().updateProfile(
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
                                GetIt.I<AuthCubit>().updateProfile(
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
              ),
            ],
          );
        },
      ),
    );
  }
}
