import 'package:anime_list/blocs/login/login_bloc.dart';
import 'package:anime_list/blocs/register/register_bloc.dart';
import 'package:anime_list/blocs/register/register_event.dart';
import 'package:anime_list/blocs/register/register_state.dart';
import 'package:anime_list/gen/assets.gen.dart';
import 'package:anime_list/gen/colors.gen.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/presentation/widgets/buttons/round_button.dart';
import 'package:anime_list/presentation/widgets/buttons/round_gradient_button.dart';
import 'package:anime_list/presentation/widgets/dialog/custom_dialog.dart';
import 'package:anime_list/presentation/widgets_controller/custom_progress_indicator_controller.dart';
import 'package:anime_list/presentation/widgets/text_field/round_text_field.dart';
import 'package:anime_list/presentation/widgets/text_field/underline_text.dart';
import 'package:anime_list/utils/helper/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime_list/utils/helper/date_time_helper.dart' as date;

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

  RegisterScreen({super.key});

  _register() {
    if (_formKey.currentState!.validate()) {
      print(_passwordTextController.value.text);
      getIt<RegisterPageBloc>().add(
        Register(
            email: _emailTextController.value.text,
            password: _passwordTextController.value.text,
            username: _userNameTextController.value.text,
            date: date.getCurrentDateTime()),
      );
    }
  }

  _showNotify(
    BuildContext registerContext,
    String title,
    String mess,
  ) async {
    showDialog(
      barrierDismissible: false,
      context: registerContext,
      builder: (dialogContext) {
        return CustomFloatingDialog(
          title: title,
          mess: mess,
          actions: [
            RoundButton(
              title: "Confirm",
              enabled: true,
              color: ColorName.success,
              textColor: Colors.black,
              onTap: () {
                Navigator.of(dialogContext).pop();
                getIt<LoginPageBloc>().add(ResetLogin());
                Navigator.of(registerContext).pushReplacementNamed("/login");
              },
            ),
          ],
        );
      },
    );
  }

  _showAlert(
    BuildContext loginContext,
    String title,
    String mess,
  ) {
    showDialog(
      barrierDismissible: false,
      context: loginContext,
      builder: (dialogContext) {
        return CustomFloatingDialog(
          title: title,
          mess: mess,
          actions: [
            RoundButton(
              title: "Cancel",
              enabled: true,
              color: ColorName.primaryColor,
              textColor: Colors.white,
              onTap: () {
                Navigator.of(dialogContext).pop();
                getIt<RegisterPageBloc>().add(ResetRegister());
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext registerContext) {
    return BlocProvider<RegisterPageBloc>.value(
      value: getIt<RegisterPageBloc>(),
      child: BlocConsumer<RegisterPageBloc, RegisterPageState>(
        listener: (context, state) {
          if (state is RegisterProcessingState) {
            // _showLoading(registerContext);
            getIt<CustomProgressIndicatorController>()
                .showLoading(registerContext);
          } else if (state is RegisterSuccessState) {
            getIt<CustomProgressIndicatorController>().hideLoading();
            _showNotify(registerContext, "Success",
                "Account registered, return to login screen");
          } else if (state is RegisterFailState) {
            getIt<CustomProgressIndicatorController>().hideLoading();
            _showAlert(registerContext, "Fail to register", state.error);
          }
        },
        builder: (context, state) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  SafeArea(
                      child: Assets.image.registerBackground.image(
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                  )),
                  Positioned(
                      top: getIt<ScreenUtil>().height / 30,
                      left: 20,
                      right: 20,
                      height: getIt<ScreenUtil>().height / 2.5,
                      child: Assets.image.logo.image(
                        fit: BoxFit.fill,
                      )),
                  Positioned(
                    top: getIt<ScreenUtil>().height / 5 * 2,
                    left: 20,
                    right: 20,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          RoundTextField(
                            label: "Enter your email",
                            controller: _emailTextController,
                            validator: (value) {
                              if (value == "") {
                                return 'Please fill email';
                              } else {
                                return null;
                              }
                            },
                            borderColor: Colors.white,
                          ),
                          const SizedBox(height: 15),
                          RoundTextField(
                            label: "Enter your user name",
                            controller: _userNameTextController,
                            validator: (value) {
                              if (value == "") {
                                return 'Please fill user name';
                              } else {
                                return null;
                              }
                            },
                            borderColor: Colors.white,
                          ),
                          const SizedBox(height: 15),
                          RoundTextField(
                            label: "Enter your password",
                            controller: _passwordTextController,
                            validator: (value) {
                              if (value == "") {
                                return 'Please fill password';
                              } else {
                                return null;
                              }
                            },
                            borderColor: Colors.white,
                          ),
                          const SizedBox(height: 20),
                          RoundGradientButton(
                            width: getIt<ScreenUtil>().width / 3,
                            onTap: (() {
                              _register();
                            }),
                            title: 'Register',
                            colorDrom: ColorName.primaryGradientEnd,
                            colorTo: ColorName.primaryColor,
                            textColor: Colors.white,
                            enabled: true,
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(width: 20),
                                UnderlineText(
                                  width: getIt<ScreenUtil>().width / 4.5,
                                  initialValue: 'Log in',
                                  onTap: () {
                                    Navigator.of(context).pushNamed("/login");
                                  },
                                ),
                              ],
                            ),
                          ),
                          // CustomCircularProgressIndicator()
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
