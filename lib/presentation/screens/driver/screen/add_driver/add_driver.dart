import 'dart:io';

import 'package:flutter/material.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/presentation/widget/upload_image.dart';
import 'package:image_picker/image_picker.dart';

import 'widget/body.dart';

class AddDriverScreen extends StatefulWidget {
  static String? driverImageApi;

  const AddDriverScreen({super.key});

  @override
  State<AddDriverScreen> createState() => _AddDriverScreenState();
}

class _AddDriverScreenState extends State<AddDriverScreen> {
  File? childImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarNoTitle(),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Scaffold(
            appBar: customAppbar(title: "", context: context),
            body: const AddDriverBody(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: UploadImageWidget(
              title: translateString("Add image", "أضف صوره"),
              selectedImage: childImage,
              ontap: () => uploadImage(
                context: context,
                ontapGallery: () async {
                  final ImagePicker picker = ImagePicker();

                  final image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      childImage = File(image.path);
                      AddDriverScreen.driverImageApi = image.path;
                    });
                  }
                  MagicRouter.pop();
                },
                ontapCamera: () async {
                  final ImagePicker picker = ImagePicker();

                  final image =
                      await picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    setState(() {
                      childImage = File(image.path);
                      AddDriverScreen.driverImageApi = image.path;
                    });
                  }
                  MagicRouter.pop();
                },
              ),
              image: AppIcons.addImage,
            ),
          ),
        ],
      ),
    );
  }
}
