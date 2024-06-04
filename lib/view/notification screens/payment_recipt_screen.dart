import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/common%20copounents/custom_textformfield.dart';
import 'package:rct/common%20copounents/main_button.dart';
import 'package:rct/common%20copounents/pop_up.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/view-model/functions/file_picker.dart';
import 'package:rct/view/home_screen.dart';

class PaymentReciptScreen extends StatelessWidget {
  const PaymentReciptScreen({super.key});
  final String screenId = "PaymentReciptScreen";

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: BackButtonAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              local.attachTransferReceipt,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: constVerticalPadding),
            InkWell(
              child: Image.asset("$imagePath/upload-photo.png"),
              onTap: () => openFilePicker(context),
            ),
            SizedBox(height: constVerticalPadding),
            Text(
              local.otherDetailsOrInformation,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: constVerticalPadding),
            TextFormFieldCustom(
              context: context,
              border: false,
              length: 100,
              labelText: local.pleaseWriteOtherDetails,
              onChanged: (value) {},
              controller: controller,
            ),
            SizedBox(height: constVerticalPadding),
            Center(
              child: MainButton(
                text: local.submitRequest,
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
                            content: ListTile(
                          titleAlignment: ListTileTitleAlignment.center,
                          title: Text(local.requestSentSuccessfully),
                          subtitle: Text(local.requestWillBeReviewed),
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
