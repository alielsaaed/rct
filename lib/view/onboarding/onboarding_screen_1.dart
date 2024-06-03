import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rct/view/auth/login_screen.dart';
import 'package:rct/constants/constants.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        finishButtonText: 'بدء الاستخدام',
        onFinish: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const OnboardingScreenOne(),
            ),
          );
        },
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: primaryColor,
        ),
        skipTextButton: Text(
          'تخطي',
          style: TextStyle(
            fontSize: 16,
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Text(
          'تسجيل دخول',
          style: TextStyle(
            fontSize: 16,
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailingFunction: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        },
        controllerColor: primaryColor,
        totalPage: 3,
        headerBackgroundColor: Colors.white,
        pageBackgroundColor: Colors.white,
        background: [
          Image.asset(
            'assets/images/2.png',
            height: 900,
            alignment: Alignment.topCenter,
          ),
          Image.asset(
            'assets/images/3.png',
            height: 900,
            alignment: Alignment.topCenter,
          ),
          Image.asset(
            'assets/images/4.png',
            height: 900,
            alignment: Alignment.topCenter,
          ),
        ],
        speed: 1.8,
        centerBackground: true,
        pageBodies: [
          Container(
              // alignment: Alignment.center,
              // width: MediaQuery.of(context).size.width,
              // padding: const EdgeInsets.symmetric(horizontal: 40),
              ),
          Container(
              // alignment: Alignment.center,
              // width: MediaQuery.of(context).size.width,
              // padding: const EdgeInsets.symmetric(horizontal: 40),
              ),
          Container(
              // alignment: Alignment.center,
              // width: MediaQuery.of(context).size.width,
              // padding: const EdgeInsets.symmetric(horizontal: 40),
              ),
        ],
      ),
    );
  }
}
