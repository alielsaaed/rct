import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/constants/routes_config.dart';
import 'package:rct/model/order_model.dart';
import 'package:rct/view-model/cubits/order%20number/order_number_cubit.dart';
import 'package:rct/view-model/functions/snackbar.dart';

class DesignAndScreen extends StatelessWidget {
  const DesignAndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    List<String> items = [];
    var data = [];

    context.read<OrderNumberCubit>().fetchOrders();
    OrderModel orderModel = Provider.of<OrderModel>(context, listen: false);
    return BlocConsumer<OrderNumberCubit, OrderNumberState>(
      listener: (context, state) {
        if (state is OrderNumberFailure) {
          showSnackBar(context, state.errMessage, redColor);
        } else if (state is OrderNumberSuccess) {
          if (state.orderNumber.isEmpty) {
            showSnackBar(context, local.noRequests, redColor);
          } else {
            data = state.orderNumber;
            items = data.map((map) => map["number"] as String).toList();
            orderModel.orderNumbers = items;
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: BackButtonAppBar(context),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(constHorizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset("$imagePath/banner-photo.png"),
                  ),
                  SizedBox(height: constVerticalPadding),
                  Text(
                    local.categories,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: constVerticalPadding),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed(AppRoutes.diagramsScreen),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF747171).withOpacity(0.3),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                local.plans,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: blackColor.withOpacity(0.5),
                                    ),
                              ),
                              leading: Image.asset(
                                "$iconsPath/fluent_building-home-24-regular.png",
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: constHorizontalPadding),
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed(AppRoutes.designsScreen),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF0661E9).withOpacity(0.3),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                local.designs,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: const Color(0xFF0661E9),
                                    ),
                              ),
                              leading: Image.asset(
                                "$iconsPath/material-symbols_add-home-work.png",
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: constVerticalPadding),
                  InkWell(
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.customDesignAndDiagramsScreen),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D8386).withOpacity(0.3),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Center(
                        child: ListTile(
                          titleAlignment: ListTileTitleAlignment.center,
                          title: Text(
                            local.customPlansAndDesigns,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: const Color(0xFF2D8386),
                                    ),
                          ),
                          leading: Image.asset(
                            "$iconsPath/Vector.png",
                            width: 30.w,
                            height: 30.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: constVerticalPadding),
                  // Text(
                  //   "المميز",
                  //   style: Theme.of(context).textTheme.bodyLarge,
                  // ),
                  // SizedBox(height: constVerticalPadding),
                  // SizedBox(
                  //   height: 300,
                  //   width: 500,
                  //   child: GridView.builder(
                  //     gridDelegate:
                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                  //             crossAxisCount: 1),
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: 5,
                  //     itemBuilder: (context, index) {
                  //       return CardContainer(
                  //         image: "assets/images/Rectangle 122.png",
                  //         title: "تصميم مودرن ",
                  //         onTap: () {},
                  //       );
                  //       // return CardContainer(
                  //       //   image:
                  //       //       "https://st2.depositphotos.com/159113333/8812/i/450/depositphotos_88120646-stock-photo-idddssdsddsyllic-summer-landscape-with-cllear.jpg",
                  //       //   title: "تصميم مودرن ",
                  //       //   onTap: () {},
                  //       // );
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
