import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/common%20copounents/custom_checkbox.dart';
import 'package:rct/common%20copounents/main_button.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/constants/routes_config.dart';
import 'package:rct/model/order_model.dart';

class TotalCostScreen extends StatefulWidget {
  const TotalCostScreen({super.key});

  @override
  State<TotalCostScreen> createState() => _TotalCostScreenState();
}

class _TotalCostScreenState extends State<TotalCostScreen> {
  bool showButton = false;
  TextEditingController controller = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    OrderModel orderModel = Provider.of<OrderModel>(context, listen: false);
    var local = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: BackButtonAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              local.totalProjectCost,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: constVerticalPadding),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 400.w,
              height: 50.h,
              child: Text(
                "${orderModel.cost} ${local.sar}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            // TextFormFieldCustom(
            //   context: context,
            //   labelText: "ريال",
            //   controller: controller,
            //   number: true,
            //   onChanged: (value) {},
            // ),
            SizedBox(height: constVerticalPadding),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomCheckbox(
                    isChecked: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                        showButton = value ? true : false;
                      });
                    },
                  ),
                ),
                Text(local.agreeToTermsAndConditions),
              ],
            ),
            Text(
              local.termsConditions,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.blue,
                  ),
            ),
            SizedBox(height: constVerticalPadding),
            showButton
                ? MainButton(
                    text: local.next,
                    backGroundColor: primaryColor,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.confirmationScreen),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
