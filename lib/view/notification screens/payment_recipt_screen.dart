import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/common%20copounents/custom_textformfield.dart';
import 'package:rct/common%20copounents/main_button.dart';
import 'package:rct/common%20copounents/pop_up.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/constants/routes_config.dart';
import 'package:rct/view-model/functions/file_picker.dart';
import 'package:rct/view/home_screen.dart';

class PaymentReciptScreen extends StatelessWidget {
  const PaymentReciptScreen({super.key});
  final String screenId = "PaymentReciptScreen";

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: BackButtonAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "إرفاق إيصال التحويل",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: constVerticalPadding),
            InkWell(
              child: Image.asset("$imagePath/upload-photo.png"),
              onTap: () => openFilePicker(context),
            ),
            SizedBox(height: constVerticalPadding),
            Text(
              "تفاصيل او معلومات اخرى",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: constVerticalPadding),
            TextFormFieldCustom(
              context: context,
              border: false,
              length: 100,
              labelText: "يرجى كتابة اي تفاصيل اخرى",
              onChanged: (value) {},
              controller: controller,
            ),
            SizedBox(height: constVerticalPadding),
            Center(
              child: MainButton(
                text: "إرسال الطلب",
                backGroundColor: primaryColor,
                onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ShowPopUp(
                        title: Center(
                          child: Image.asset(
                            "assets/icons/popUp-icon.png",
                            height: 50.h,
                            width: 50.w,
                          ),
                        ),
                        content: const ListTile(
                          titleAlignment: ListTileTitleAlignment.center,
                          title: Text("تم إرسال الطلب بنجاح"),
                          subtitle: Text(
                              "سيتم دراسة الطلب قريباً يمكنك مراجعة الاشعارات"),
                        ),
                        ontap: () => Navigator.of(context)
                            .pushNamedAndRemoveUntil(
                                HomeScreen.id, (route) => false),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
