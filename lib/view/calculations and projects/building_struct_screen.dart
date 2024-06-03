import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/common%20copounents/custom_dropdownlist.dart';
import 'package:rct/common%20copounents/custom_textformfield.dart';
import 'package:rct/common%20copounents/main_button.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/constants/routes_config.dart';
import 'package:rct/model/order_model.dart';
import 'package:rct/view-model/cubits/types/types_cubit.dart';
import 'package:rct/view-model/functions/snackbar.dart';

class BuildingStructScreen extends StatefulWidget {
  const BuildingStructScreen({Key? key}) : super(key: key);

  @override
  State<BuildingStructScreen> createState() => _BuildingStructScreenState();
}

class _BuildingStructScreenState extends State<BuildingStructScreen> {
  String? _selectedType;
  int? selectedId;
  String? selectedPrice;
  bool showButton = false;
  TextEditingController apartmentController = TextEditingController();
  TextEditingController floorsController = TextEditingController();
  List<dynamic>? data;
  bool isLoading = false;
  List<String> itemNames = [];
  Map<String, Map<String, dynamic>> nameToDetails = {};

  @override
  void initState() {
    super.initState();
    context.read<TypesCubit>().get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackButtonAppBar(context),
      body: BlocBuilder<TypesCubit, TypesState>(
        builder: (context, state) {
          OrderModel orderModel =
              Provider.of<OrderModel>(context, listen: false);

          if (state is TypesLoading) {
            isLoading = true;
          } else if (state is TypesFailure) {
            isLoading = false;
            SchedulerBinding.instance.addPostFrameCallback((_) {
              showSnackBar(context, state.errMessage, Colors.red);
            });
          } else if (state is TypesSuccess) {
            isLoading = false;
            data = state.types;
            itemNames = data!.map((item) => item['name'] as String).toList();
            for (var item in data!) {
              nameToDetails[item['name']] = {
                'id': item['id'],
                'price': item['price']
              };
            }
          }

          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "آلية البناء",
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
                        list: itemNames,
                        selectedValue: _selectedType,
                        onChanged: (String? newValue) {
                          setState(() {
                            showButton = true;
                            _selectedType = newValue!;
                            selectedId = nameToDetails[newValue]!['id'];
                            selectedPrice = nameToDetails[newValue]!['price'];
                            // _selectedType = nameToDetails[newValue]!['name'];
                            print(_selectedType == "مجمع سكنى");
                          });
                        },
                        hint: "اختر النوع",
                      ),
                    ),
                    SizedBox(height: constVerticalPadding),
                    Center(
                      child: showButton
                          ? _selectedType == "مجمع سكنى"
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "عدد الأدوار",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    SizedBox(height: constVerticalPadding),
                                    TextFormFieldCustom(
                                      context: context,
                                      labelText: "ادخل عدد الأدوار",
                                      controller: floorsController,
                                      onChanged: (value) {},
                                    ),
                                    SizedBox(height: constVerticalPadding),
                                    Text(
                                      "عدد الشقق",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    SizedBox(height: constVerticalPadding),
                                    TextFormFieldCustom(
                                      context: context,
                                      labelText: "ادخل عدد الشقق",
                                      onChanged: (value) {},
                                      controller: apartmentController,
                                    ),
                                    SizedBox(height: constVerticalPadding),
                                    Center(
                                      child: MainButton(
                                        text: "التالي",
                                        backGroundColor: primaryColor,
                                        onTap: () {
                                          orderModel.type_id = selectedId!;
                                          if (kDebugMode) {
                                            print(orderModel.type_id);
                                          }
                                          Navigator.of(context).pushNamed(
                                              AppRoutes.floorDetails);
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : MainButton(
                                  text: "التالي",
                                  backGroundColor: primaryColor,
                                  onTap: () {
                                    orderModel.type_id = selectedId!;
                                    orderModel.cost = selectedPrice!;
                                    if (kDebugMode) {
                                      print("build_id: ${orderModel.type_id}");
                                    }
                                    Navigator.of(context)
                                        .pushNamed(AppRoutes.floorDetails);
                                  },
                                )
                          : Container(),
                    )
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
