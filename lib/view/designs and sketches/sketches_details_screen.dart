import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/common%20copounents/custom_dropdownlist.dart';
import 'package:rct/common%20copounents/custom_textformfield.dart';
import 'package:rct/common%20copounents/main_button.dart';
import 'package:rct/common%20copounents/pop_up.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/constants/routes_config.dart';
import 'package:rct/model/order_model.dart';
import 'package:rct/view-model/cubits/order%20number/order_number_cubit.dart';
import 'package:rct/view-model/functions/snackbar.dart';
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
    items = orderModel.orderNumbers;
    return Scaffold(
      appBar: BackButtonAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Text(
              "ادخل رقم الطلب",
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
                hint: "يرجى اختيار رقم الطلب",
              ),
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
            )
          ],
        ),
      ),
    );
  }
}
