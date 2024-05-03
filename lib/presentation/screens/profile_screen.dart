// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:anime_list/presentation/widgets/card/avatar_card.dart';
import 'package:anime_list/presentation/widgets_controller/custom_progress_indicator_controller.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anime_list/blocs/profile/profile_bloc.dart';
import 'package:anime_list/blocs/profile/profile_state.dart';
import 'package:anime_list/data/models/user_account_model.dart';
import 'package:anime_list/gen/colors.gen.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/presentation/widgets/buttons/round_gradient_button.dart';
import 'package:anime_list/presentation/widgets/indicator/custom_refresh_indicator.dart';
import 'package:anime_list/presentation/widgets/text_field/round_text_field.dart';
import 'package:anime_list/utils/helper/screen_size.dart';
import 'package:anime_list/utils/helper/share_preferences.dart' as sharePref;

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    Key? key,
    required this.currentUser,
    required this.imgBase64,
  }) : super(key: key);

  UserDataModel currentUser;
  String imgBase64;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext profileContext) {
    return BlocProvider<ProfilePageBloc>.value(
      value: getIt<ProfilePageBloc>(),
      child: BlocConsumer<ProfilePageBloc, ProfilePageState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is ProfileLoadingState) {
            getIt<CustomProgressIndicatorController>()
                .showLoading(profileContext);
          } else if (state is ProfileLoadedState) {
            getIt<CustomProgressIndicatorController>().hideLoading();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: (() {
                    // Navigator.of(context).pushReplacementNamed('/edit_profile');
                  }),
                  icon: const Icon(Icons.edit),
                )
              ],
              centerTitle: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(width: 2)),
              title: Text(
                "Profile",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            body: CustomCloudRefreshIndicator(
              onRefresh: () {
                //TODO refresh bloc
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AvatarCard(
                      isEditting: false,
                      child: Image.memory(base64Decode(widget.imgBase64)),
                    ),
                    // CircleAvatar(
                    //   radius: 56,
                    //   backgroundColor: ColorName.primaryColor,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8), // Border radius
                    //     child: ClipOval(
                    //       child: Image.memory(base64Decode(widget.imgBase64)),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 30),
                    RoundTextField(
                      enable: false,
                      controller: TextEditingController(
                          text: widget.currentUser.userName),
                      label: "User name",
                    ),
                    const SizedBox(height: 15),
                    RoundTextField(
                      enable: false,
                      controller: TextEditingController(
                          text: widget.currentUser.userEmail),
                      label: "User email",
                    ),
                    const SizedBox(height: 15),
                    RoundTextField(
                      enable: false,
                      controller: TextEditingController(
                          text: DateTime.fromMillisecondsSinceEpoch(
                                  widget.currentUser.joinSince)
                              .toString()),
                      label: "Join Since",
                    ),
                    const SizedBox(height: 15),
                    RoundGradientButton(
                      width: getIt<ScreenUtil>().width / 3,
                      onTap: (() async {
                        await sharePref.deleteUserFromSharedPreferences();
                        Navigator.of(profileContext)
                            .pushReplacementNamed('/login');
                      }),
                      title: 'Logout',
                      colorDrom: ColorName.primaryGradientEnd,
                      colorTo: ColorName.primaryColor,
                      textColor: Colors.white,
                      enabled: true,
                    ),
                    const SizedBox(height: 15),
                    RoundTextField(
                      enable: false,
                      controller: TextEditingController(
                          text: widget.currentUser.userEmail),
                      label: "User email",
                    ),
                    const SizedBox(height: 15),
                    RoundTextField(
                      enable: false,
                      controller: TextEditingController(
                          text: widget.currentUser.userEmail),
                      label: "User email",
                    ),
                    const SizedBox(height: 15),
                    RoundTextField(
                      enable: false,
                      controller: TextEditingController(
                          text: widget.currentUser.userEmail),
                      label: "User email",
                    ),
                    const SizedBox(height: 15),
                    RoundTextField(
                      enable: false,
                      controller: TextEditingController(
                          text: widget.currentUser.userEmail),
                      label: "User email",
                    ),
                    const SizedBox(height: 15),
                    RoundTextField(
                      enable: false,
                      controller: TextEditingController(
                          text: widget.currentUser.userEmail),
                      label: "User email",
                    ),
                    const SizedBox(height: 15),
                    RoundTextField(
                      enable: false,
                      controller: TextEditingController(
                          text: widget.currentUser.userEmail),
                      label: "User email",
                    ),
                    const SizedBox(height: 15),
                    RoundTextField(
                      enable: false,
                      controller: TextEditingController(
                          text: widget.currentUser.userEmail),
                      label: "User email",
                    ),
                    const SizedBox(height: 15),
                    RoundTextField(
                      enable: false,
                      controller: TextEditingController(
                          text: widget.currentUser.userEmail),
                      label: "User email",
                    ),
                    const SizedBox(height: 15),
                    RoundTextField(
                      enable: false,
                      controller: TextEditingController(
                          text: widget.currentUser.userEmail),
                      label: "User email",
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
