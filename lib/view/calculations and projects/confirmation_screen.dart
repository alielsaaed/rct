import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/common%20copounents/custom_textformfield.dart';
import 'package:rct/common%20copounents/main_button.dart';
import 'package:rct/common%20copounents/pop_up.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/model/order_model.dart';
import 'package:rct/view-model/cubits/order/order_cubit.dart';
import 'package:rct/view-model/functions/file_picker.dart';
import 'package:rct/view-model/functions/image_picker.dart';
import 'package:rct/view-model/functions/location_permission.dart';
import 'package:rct/view-model/functions/snackbar.dart';
import 'package:rct/view/google%20maps/pin_location_screen.dart';
import 'package:rct/view/home_screen.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  TextEditingController controller = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    OrderModel orderModel = Provider.of<OrderModel>(context, listen: false);

    return Scaffold(
      appBar: BackButtonAppBar(context),
      body: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is OrderLoading) {
            setState(() {
              const Center(
                child: CircularProgressIndicator(),
              );
            });
          }
          if (state is OrderFailure) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              showSnackBar(context, state.errMessage, Colors.red);
            });
          } else if (state is OrderSuccess) {
            showDialog(
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
                    ontap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                        HomeScreen.id, (route) => false),
                  );
                });
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "الهوية الوطنية أو السجل التجاري *",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: constVerticalPadding),
                    InkWell(
                      child: Image.asset("$imagePath/upload-photo.png"),
                      onTap: () => pickImageFromGallery().then((value) =>
                          value != null
                              ? orderModel.nationalidimage = value
                              : null),
                    ),
                    SizedBox(height: constVerticalPadding),
                    Text(
                      "الصك الإلكتروني *",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: constVerticalPadding),
                    InkWell(
                      child: Image.asset("$imagePath/upload-photo.png"),
                      onTap: () => pickImageFromGallery().then((value) =>
                          value != null
                              ? orderModel.electronicimage = value
                              : null),
                    ),
                    SizedBox(height: constVerticalPadding),
                    Text(
                      "إضافة تقرير فحص التربة *",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "في حال لم يتوفر ستكون هناك تكلفة إضافية بمبلغ ٢٠٠٠ ريال",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.red,
                            fontWeight: mainFontWeight,
                          ),
                    ),
                    SizedBox(height: constVerticalPadding),
                    InkWell(
                      child: Image.asset("$imagePath/upload-photo.png"),
                      onTap: () => pickImageFromGallery().then((value) =>
                          value != null
                              ? orderModel.landCheckImage = value
                              : null),
                    ),
                    Text(
                      "موقع العقار",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: constVerticalPadding),
                    InkWell(
                        child: Image.asset("$imagePath/Frame 177.png"),
                        onTap: () async {
                          await LocationPermission()
                              .requestLocationPermission()
                              .then((value) =>
                                  LocationPermission().getCurrentLocation());
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        PinLocationScreen(
                                  onPlacePicked: (p0) {
                                    orderModel.lat =
                                        p0.geometry!.location.lat.toString();
                                    orderModel.long =
                                        p0.geometry!.location.lng.toString();
                                    orderModel.location = p0.name!;
                                    if (kDebugMode) {
                                      print(orderModel.location);
                                    }
                                    Navigator.pop(context);
                                  },
                                ),
                              ));
                        }),
                    SizedBox(height: constVerticalPadding),
                    TextFormFieldCustom(
                      context: context,
                      labelText: "أو إدخال رابط الموقع",
                      onChanged: (value) {},
                      controller: controller,
                      // number: true,
                    ),
                    SizedBox(height: constVerticalPadding),
                    Center(
                      child: MainButton(
                          text: "إرسال",
                          backGroundColor: primaryColor,
                          onTap: () async {
                            await context.read<OrderCubit>().pushOrder(context);
                          }),
                    ),
                    SizedBox(height: constVerticalPadding),
                    Center(
                      child: MainButton(
                        text: "إلغاء الطلب",
                        backGroundColor: grey,
                        onTap: () => Navigator.of(context)
                            .pushNamedAndRemoveUntil(
                                HomeScreen.id, (route) => false),
                      ),
                    ),
                    SizedBox(height: constVerticalPadding),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
