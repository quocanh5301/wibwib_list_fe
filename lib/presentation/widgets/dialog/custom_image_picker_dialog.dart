// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:anime_list/utils/helper/image_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:anime_list/data/models/user_account_model.dart';
import 'package:anime_list/data/repositories/user_repository.dart';
import 'package:anime_list/gen/colors.gen.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/presentation/widgets_controller/custom_image_picker_controller.dart';
import 'package:anime_list/utils/helper/share_preferences.dart' as sharePref;

class CustomImagePickerDialog extends StatelessWidget {
  const CustomImagePickerDialog({
    Key? key,
  }) : super(key: key);

  show(BuildContext parentCtc) {
    showModalBottomSheet(
        context: parentCtc,
        builder: (BuildContext ImagePickerContext) {
          return build(ImagePickerContext);
        }).then((value) {
      getIt<CustomImagePickerController>().clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
            child: GestureDetector(
              onTap: () async {
                 UserDataModel? currentUser =
                    await sharePref.getUserFromSharedPreferences();

                final image = await getIt<ImageHelper>()
                    .getImage(ImageSource.camera, false);
                if (currentUser != null) {
                  if (image != null) {
                    if (currentUser.image != null) {
                      try {
                        final croppedImg = await getIt<ImageHelper>()
                            .cropImage(image[0].path, CropStyle.circle);
                        getIt<IUserRepository>().updateImage(
                          imageId: currentUser.image!,
                          image: File(croppedImg!.path),
                          userId: currentUser.id,
                        );
                      } catch (e) {
                        print("error is: $e");
                      }
                    } else {
                      try {
                        getIt<IUserRepository>().uploadImage(
                          image: File(image![0].path),
                          userId: currentUser.id,
                        );
                      } catch (e) {
                        print("error is: $e");
                      }
                    }
                  }
                } else {
                  print("No user data save, at $context");
                  Navigator.of(context).pushReplacementNamed('/login');
                }

                getIt<CustomImagePickerController>().hidePicker();
              },
              child: const ListTile(
                title: Text(
                  "camera",
                  style: TextStyle(fontSize: 19),
                ),
                leading: Icon(
                  Icons.camera_alt,
                  color: ColorName.primaryColor,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: GestureDetector(
              onTap: () async {
                UserDataModel? currentUser =
                    await sharePref.getUserFromSharedPreferences();

                final image = await getIt<ImageHelper>()
                    .getImage(ImageSource.gallery, false);
                if (currentUser != null) {
                  if (image != null) {
                    if (currentUser.image != null) {
                      try {
                        final croppedImg = await getIt<ImageHelper>()
                            .cropImage(image[0].path, CropStyle.circle);
                        getIt<IUserRepository>().updateImage(
                          imageId: currentUser.image!,
                          image: File(croppedImg!.path),
                          userId: currentUser.id,
                        );
                      } catch (e) {
                        print("error is: $e");
                      }
                    } else {
                      try {
                        getIt<IUserRepository>().uploadImage(
                          image: File(image![0].path),
                          userId: currentUser.id,
                        );
                      } catch (e) {
                        print("error is: $e");
                      }
                    }
                  }
                } else {
                  print("No user data save, at $context");
                  Navigator.of(context).pushReplacementNamed('/login');
                }

                getIt<CustomImagePickerController>().hidePicker();
              },
              child: const ListTile(
                title: Text(
                  "gallery_image",
                  style: TextStyle(fontSize: 19),
                ),
                leading: Icon(
                  Icons.photo,
                  color: ColorName.primaryColor,
                  size: 30,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
