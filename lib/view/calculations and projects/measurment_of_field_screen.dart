import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/common%20copounents/custom_textFormField.dart';
import 'package:rct/common%20copounents/main_button.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/constants/routes_config.dart';
import 'package:rct/model/order_model.dart';
import 'package:rct/view-model/functions/snackbar.dart';
import 'package:rct/view-model/services/create_areaspace.dart';

class MeasurmentOfFieldScreen extends StatefulWidget {
  static String id = "MeasurmentOfFieldScreen";

  const MeasurmentOfFieldScreen({super.key});

  @override
  State<MeasurmentOfFieldScreen> createState() =>
      _MeasurmentOfFieldScreenState();
}

class _MeasurmentOfFieldScreenState extends State<MeasurmentOfFieldScreen> {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    OrderModel orderModel = Provider.of<OrderModel>(context, listen: false);
    var local = AppLocalizations.of(context)!;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: BackButtonAppBar(context),
        body: SafeArea(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    local.totalLandArea,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: mainFontWeight,
                        ),
                  ),
                  SizedBox(height: constVerticalPadding),
                  TextFormFieldCustom(
                    context: context,
                    labelText: local.pleaseEnterTotalArea,
                    onChanged: (value) {},
                    controller: controller,
                    border: true,
                    number: true,
                  ),
                  SizedBox(
                    height: constVerticalPadding,
                  ),
                  Center(
                    child: MainButton(
                      text: local.next,
                      backGroundColor: primaryColor,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          // Navigator.pushNamed(
                          //     context, AppRoutes.buildingStructScreen);
                          setState(() {
                            isLoading = true;
                            orderModel.areaspace =
                                double.parse(controller.text);
                          });
                          await CreateAreaSpace()
                              .create(controller.text, context)
                              .then((value) => {
                                    value
                                        ? {
                                            setState(() {
                                              isLoading = false;
                                            }),
                                            Navigator.pushNamed(context,
                                                AppRoutes.buildingStructScreen),
                                          }
                                        : {
                                            setState(() {
                                              isLoading = false;
                                            }),
                                            showSnackBar(
                                                context,
                                                local.errorPleaseTryAgain,
                                                redColor)
                                          }
                                  });
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
