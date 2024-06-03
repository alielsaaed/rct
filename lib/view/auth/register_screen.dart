import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/common%20copounents/custom_textformfield.dart';
import 'package:rct/common%20copounents/custom_textformfield_password.dart';
import 'package:rct/common%20copounents/main_button.dart';
import 'package:rct/model/auth/register_model.dart';
import 'package:rct/view-model/cubits/register/register_cubit.dart';
import 'package:rct/view-model/functions/image_picker.dart';
import 'package:rct/view-model/functions/snackbar.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/view-model/cubits/login/login_cubit.dart';
import 'package:rct/view/auth/login_screen.dart';
import 'package:rct/view/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  static String id = "RegisterScreen";
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final registerModel = Provider.of<RegisterModel>(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, LoginScreen.id, (route) => false);
        } else if (state is RegisterFailed) {
          isLoading = false;
          showSnackBar(context, "حدث خطاء اثناء تسجيل الدخول", redColor);
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
                      "انشاء حساب",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: constHorizontalPadding,
                      ),
                      child: TextFormFieldCustom(
                        context: context,
                        controller: nameController,
                        labelText: "الاسم",
                        onChanged: (value) {
                          registerModel.name = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: constHorizontalPadding,
                          vertical: constVerticalPadding),
                      child: TextFormFieldCustom(
                        context: context,
                        controller: emailController,
                        labelText: "الايميل",
                        onChanged: (value) {
                          registerModel.email = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: constHorizontalPadding,
                      ),
                      child: PasswordFormFieldCustom(
                        // context: context,
                        controller: passwordController,
                        labelText: "كلمه المرور",
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(
                      height: constVerticalPadding,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: constHorizontalPadding,
                        ),
                        child: MainButton(
                          text: "اختيار صوره",
                          backGroundColor: darkGrey,
                          width: 500.w,
                          onTap: () {
                            pickImageFromGallery().then(
                              (value) => registerModel.image = value,
                            );
                          },
                        )),
                    SizedBox(
                      height: constVerticalPadding,
                    ),
                    MainButton(
                        text: "دخول",
                        backGroundColor: primaryColor,
                        onTap: () {
                          registerModel.email = emailController.text;
                          registerModel.password = passwordController.text;
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context)
                                .signup(registerModel, context);
                          }
                        }),
                    const Spacer(),
                    Text.rich(
                      TextSpan(
                        text: "  لديك حساب؟",
                        children: <InlineSpan>[
                          TextSpan(
                            text: " تسجيل دخول ",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.blue,
                                    ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  Navigator.pushNamed(context, LoginScreen.id),
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
