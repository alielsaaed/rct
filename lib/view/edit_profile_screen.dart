import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rct/common%20copounents/custom_textformfield.dart';
import 'package:rct/common%20copounents/main_button.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/common%20copounents/pop_up.dart';
import 'package:rct/constants/routes_config.dart';
import 'package:rct/view/home_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
  final screenId = "EditProfileScreen";
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: whiteBackGround,
          ),
        ),
        title: Text(
          "الملف الشخصي",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: whiteBackGround,
              ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: primaryColor,
              ),
            ),
          ),
          Positioned.fill(
            top: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "$iconsPath/logo_without_text-icon.png",
                        height: 100.h,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  minRadius: 60,
                                  child: Image.asset(
                                    "$imagePath/Profile-Male-PNG.png",
                                    width: 120.w,
                                    height: 120.h,
                                  ),
                                ),
                                Positioned(
                                  bottom: 2,
                                  right: -60,
                                  left: 0,
                                  child: SvgPicture.asset(
                                      "$iconsPath/Edit Image.svg"),
                                )
                              ],
                            ),
                            Text(
                              "أحمد عبدالله",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: constVerticalPadding),
                      Text(
                        "الاسم",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: constVerticalPadding),
                      TextFormFieldCustom(
                        context: context,
                        labelText: "ادخل اسمك",
                        onChanged: (value) {},
                        controller: controller1,
                      ),
                      SizedBox(height: constVerticalPadding),
                      Text(
                        "الهاتف",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: constVerticalPadding),
                      TextFormFieldCustom(
                        context: context,
                        labelText: "ادخل رقم الهاتف",
                        onChanged: (value) {},
                        controller: controller2,
                        number: true,
                      ),
                      SizedBox(height: constVerticalPadding),
                      Text(
                        "الإيميل",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: constVerticalPadding),
                      TextFormFieldCustom(
                        context: context,
                        labelText: "ادخل الإيميل",
                        onChanged: (value) {},
                        controller: controller3,
                        number: true,
                      ),
                      SizedBox(height: constVerticalPadding),
                      MainButton(
                        text: "حفظ",
                        backGroundColor: primaryColor,
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context, HomeScreen.id, (route) => false),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
