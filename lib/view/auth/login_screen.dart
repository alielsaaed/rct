import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:rct/common%20copounents/custom_textformfield.dart';
import 'package:rct/common%20copounents/custom_textformfield_password.dart';
import 'package:rct/common%20copounents/main_button.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/model/auth/login_model.dart';
import 'package:rct/view-model/cubits/login/login_cubit.dart';
import 'package:rct/view-model/functions/snackbar.dart';
import 'package:rct/view/auth/register_screen.dart';
import 'package:rct/view/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = "LoginScreen";
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    final loginModel = Provider.of<LoginModel>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.id, (route) => false);
        } else if (state is LoginFailed) {
          isLoading = false;
          showSnackBar(context, state.errMessage, redColor);
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      height: 90.h,
                      width: 190.w,
                      alignment: Alignment.topCenter,
                    ),
                    Text(
                      local.login,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: constHorizontalPadding,
                          vertical: constVerticalPadding),
                      child: TextFormFieldCustom(
                        context: context,
                        controller: emailController,
                        labelText: local.email,
                        onChanged: (value) {
                          loginModel.email = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: constHorizontalPadding,
                      ),
                      child: PasswordFormFieldCustom(
                        controller: passwordController,
                        labelText: local.password,
                        onChanged: (value) {
                          loginModel.password = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: constVerticalPadding,
                    ),
                    MainButton(
                      text: local.enter,
                      backGroundColor: primaryColor,
                      onTap: () {
                        if (kDebugMode) {
                          print(loginModel.email);
                          print(loginModel.password);
                        }
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context)
                              .login(loginModel, context);
                        }
                      },
                    ),
                    const Spacer(),
                    Text.rich(
                      TextSpan(
                        text: local.doNotHaveAccount,
                        children: <InlineSpan>[
                          TextSpan(
                            text: local.createAccount,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.blue,
                                    ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pushNamed(
                                  context, RegisterScreen.id),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
