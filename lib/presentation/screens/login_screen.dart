import 'package:anime_list/blocs/login/login_bloc.dart';
import 'package:anime_list/gen/assets.gen.dart';
import 'package:anime_list/gen/colors.gen.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/presentation/widgets/buttons/round_button.dart';
import 'package:anime_list/presentation/widgets/buttons/round_gradient_button.dart';
import 'package:anime_list/presentation/widgets/dialog/custom_alert_dialog.dart';
import 'package:anime_list/presentation/widgets/animations/twist_progress_indicator.dart';
import 'package:anime_list/presentation/widgets/progress_indicator/custom_progress_indicator.dart';
import 'package:anime_list/presentation/widgets/progress_indicator/custom_progress_indicator_controller.dart';
import 'package:anime_list/presentation/widgets/text_field/round_text_field.dart';
import 'package:anime_list/presentation/widgets/text_field/underline_text.dart';
import 'package:anime_list/utils/helper/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime_list/utils/helper/share_preferences.dart' as sharePref;

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();
  // late BuildContext loadingCtx;

  _login() {
    if (_formKey.currentState!.validate()) {
      getIt<LoginPageBloc>().add(Login(
          username: _emailTextController.value.text,
          password: _passwordTextController.value.text));
    }
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
        return CustomDialog(
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
              },
            ),
            RoundButton(
              title: "Cancel",
              enabled: true,
              color: ColorName.primaryColor,
              textColor: Colors.white,
              onTap: () {
                Navigator.of(dialogContext).pop();
                getIt<LoginPageBloc>().add(ResetLogin());
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext loginContext) {
    return BlocProvider<LoginPageBloc>.value(
      value: getIt<LoginPageBloc>(),
      child: BlocConsumer<LoginPageBloc, LoginPageState>(
        listener: (context, state) {
          print(state);
          if (state is LoginProcessingState) {
            // _showLoading(loginContext);
            getIt<CustomProgressIndicatorController>()
                .showLoading(loginContext);
          } else if (state is LoginSuccessState) {
            getIt<CustomProgressIndicatorController>()
                .hideLoading(loginContext);
            // sharePref.saveUserToSharedPreferences(state.model);
            Navigator.of(context).pushReplacementNamed("/home");
          } else if (state is LoginFailState) {
            getIt<CustomProgressIndicatorController>()
                .hideLoading(loginContext);
            _showAlert(loginContext, "Fail to login", state.error);
          }
        },
        builder: (context, state) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  SafeArea(
                      child: Assets.image.loginBackground.image(
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
                          ),
                          const SizedBox(height: 20),
                          RoundGradientButton(
                            width: getIt<ScreenUtil>().width / 3,
                            onTap: (() {
                              _login();
                            }),
                            title: 'Login',
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
                                  initialValue: 'Sign Up',
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed("/register");
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
