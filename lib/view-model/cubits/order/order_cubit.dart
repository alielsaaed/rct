import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rct/constants/linkapi.dart';
import 'package:rct/model/order_model.dart';
import 'package:rct/view-model/services/crud.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  final Crud _crud = Crud();
  Future<void> pushOrder(BuildContext context) async {
    OrderModel orderModel = Provider.of<OrderModel>(context, listen: false);
    emit(OrderLoading());
    Map<String, File> images = {
      'nationalidimage': orderModel.nationalidimage,
      'electronicimage': orderModel.electronicimage,
      'landcheckimage': orderModel.landCheckImage,
    };

    try {
      var result = await _crud.postRequestWithFiles(
          linkOrders,
          {
            "build_id": orderModel.type_id,
            "location": orderModel.location,
            "lat": orderModel.lat,
            "lng": orderModel.long,
            "status": orderModel.status,
            "agreement": orderModel.agreement,
            "number": orderModel.number,
            "cost": orderModel.cost,
          },
          images);

      if (result.containsKey("data")) {
        print(result);
        emit(OrderSuccess());
      } else {
        print(result);

        emit(OrderFailure(errMessage: result.entries.toString()));
      }
    } catch (e) {
      print(e);

      emit(OrderFailure(errMessage: "$e"));
    }
  }
}
