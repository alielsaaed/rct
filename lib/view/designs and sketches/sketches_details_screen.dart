import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/common%20copounents/custom_dropdownlist.dart';
import 'package:rct/common%20copounents/custom_textformfield.dart';
import 'package:rct/common%20copounents/main_button.dart';
import 'package:rct/common%20copounents/pop_up.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/model/order_model.dart';
import 'package:rct/view/home_screen.dart';

class DiagramsDetailsScreen extends StatefulWidget {
  const DiagramsDetailsScreen({super.key});

  @override
  State<DiagramsDetailsScreen> createState() => _DiagramsDetailsScreenState();
}

class _DiagramsDetailsScreenState extends State<DiagramsDetailsScreen> {
  TextEditingController controller = TextEditingController();
  String? _selectedType;
  List<String> items = [];
  var data = [];
  // bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    OrderModel orderModel = Provider.of<OrderModel>(context, listen: false);
    var local = AppLocalizations.of(context)!;
    items = orderModel.orderNumbers;
    return Scaffold(
      appBar: BackButtonAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Text(
              local.enterRequestNumber,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: constVerticalPadding),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: grey,
              ),
              child: CustomDropDownList(
                list: items,
                selectedValue: _selectedType,
                onChanged: (String? newValue) {
                  setState(() {
                    // showButtom = true;
                    _selectedType = newValue!;
                  });
                },
                hint: local.pleaseChooseRequestNumber,
              ),
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
            )
          ],
        ),
      ),
    );
  }
}
