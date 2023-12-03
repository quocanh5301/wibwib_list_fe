// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:anime_list/data/models/user_account_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import 'package:anime_list/data/repositories/user_repository.dart';
import 'package:anime_list/gen/colors.gen.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/presentation/widgets_controller/custom_image_picker_controller.dart';
import 'package:anime_list/utils/constant/enum.dart';
import 'package:anime_list/utils/helper/share_preferences.dart' as sharePref;

class CustomImagePickerDialog extends StatelessWidget {
  final ImagePickerType imagePickerType;
  const CustomImagePickerDialog({
    Key? key,
    required this.imagePickerType,
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
    return Container(
      height: 115,
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            child: GestureDetector(
              onTap: () async {
                UserDataModel? currentUser =
                    await sharePref.getUserFromSharedPreferences();

                var image =
                    await ImagePicker.pickImage(source: ImageSource.camera);
                if (currentUser != null) {
                  if (currentUser.image != null) {
                    try {
                      getIt<IUserRepository>().updateImage(
                        imageId: currentUser.image!,
                        image: image,
                        userId: currentUser.id,
                      );
                    } catch (e) {
                      print("error is: $e");
                    }
                  } else {
                    try {
                      getIt<IUserRepository>().uploadImage(
                        image: image,
                        userId: currentUser.id,
                      );
                    } catch (e) {
                      print("error is: $e");
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
          Container(
            height: 50,
            child: GestureDetector(
              onTap: () async {
                UserDataModel? currentUser =
                    await sharePref.getUserFromSharedPreferences();

                var image =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                if (currentUser != null) {
                  if (currentUser.image != null) {
                    try {
                      getIt<IUserRepository>().updateImage(
                        imageId: currentUser.image!,
                        image: image,
                        userId: currentUser.id,
                      );
                    } catch (e) {
                      print("error is: $e");
                    }
                  } else {
                    try {
                      getIt<IUserRepository>().uploadImage(
                        image: image,
                        userId: currentUser.id,
                      );
                    } catch (e) {
                      print("error is: $e");
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
