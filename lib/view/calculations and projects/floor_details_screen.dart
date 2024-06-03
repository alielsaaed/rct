import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/common%20copounents/custom_textFormField.dart';
import 'package:rct/common%20copounents/main_button.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/constants/routes_config.dart';
import 'package:rct/model/build_types_model.dart';
import 'package:rct/model/order_model.dart';
import 'package:rct/view-model/cubits/build_types_and_floors/build_types_and_floors_cubit.dart';

class FloorDetailsScreen extends StatefulWidget {
  const FloorDetailsScreen({super.key});

  @override
  State<FloorDetailsScreen> createState() => _FloorDetailsScreenState();
}

class _FloorDetailsScreenState extends State<FloorDetailsScreen> {
  TextEditingController controller = TextEditingController();
  int? _selectedCardIndex;
  List<BuildTypesModel> buildTypesModel = [];
  bool isLoading = false;

  String? selectedName;
  double? selectedPrice;

  @override
  void initState() {
    super.initState();
    context.read<BuildTypesAndFloorsCubit>().getBuildTypes(context);
  }

  @override
  Widget build(BuildContext context) {
    OrderModel orderModel = Provider.of<OrderModel>(context, listen: false);

    return BlocBuilder<BuildTypesAndFloorsCubit, BuildTypesAndFloorsState>(
      builder: (context, state) {
        if (state is BuildTypesAndFloorsLoading) {
          isLoading = true;
        } else if (state is BuildTypesAndFloorsFailure) {
          isLoading = false;
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is BuildTypesAndFloorsSuccess) {
          isLoading = false;
          buildTypesModel = state.buildTypes;
          print(orderModel.floorDetails);
        }

        return Scaffold(
          appBar: BackButtonAppBar(context),
          body: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height / 2.5,
                        child: ListView.builder(
                          itemCount: orderModel.floorDetails.length,
                          itemBuilder: (context, index) {
                            double size = double.parse(
                                orderModel.floorDetails[index]["size"]);
                            double number = (size / 100) * orderModel.areaspace;
                            return FloorDetails(
                              text: orderModel.floorDetails[index]["name"]
                                  .toString(),
                              number: number,
                            );
                          },
                        ),
                      ),
                      Text(
                        "نوع البناء",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: mainFontWeight,
                            ),
                      ),
                      SizedBox(
                        height: 80.h,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: buildTypesModel.length,
                          itemBuilder: (context, index) => buildCard(index,
                              "${buildTypesModel[index].name!} ${buildTypesModel[index].price!} ريال"),
                        ),
                      ),
                      SizedBox(height: constVerticalPadding),
                      Center(
                        child: MainButton(
                          text: "التالي",
                          backGroundColor: primaryColor,
                          onTap: () {
                            if (selectedName != null && selectedPrice != null) {
                              // Use selectedName and selectedPrice here
                              print('Selected Name: $selectedName');
                              print('Selected Price: $selectedPrice');
                              double? cost = double.tryParse(orderModel.cost);
                              orderModel.cost =
                                  (cost! + selectedPrice!).toString();
                            }
                            Navigator.of(context)
                                .pushNamed(AppRoutes.totalCostScreen);
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
      },
    );
  }

  Widget buildCard(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCardIndex = index;
          selectedName = buildTypesModel[index].name;
          selectedPrice = double.tryParse(buildTypesModel[index].price!);
        });
      },
      child: SizedBox(
        height: 80.h,
        width: 120.w,
        child: Card(
          color: _selectedCardIndex == index ? darkGrey : whiteBackGround,
          surfaceTintColor: whiteBackGround,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(text)),
          ),
        ),
      ),
    );
  }
}

class FloorDetails extends StatelessWidget {
  final String text;
  final double number;
  const FloorDetails({
    super.key,
    required this.text,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: mainFontWeight,
              ),
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
            number.toString(),
          ),
        ),
        SizedBox(
          height: constVerticalPadding,
        ),
      ],
    );
  }
}
