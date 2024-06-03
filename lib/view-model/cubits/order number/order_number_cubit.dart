import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:rct/constants/linkapi.dart';
import 'package:rct/view-model/services/crud.dart';

part 'order_number_state.dart';

class OrderNumberCubit extends Cubit<OrderNumberState> {
  final Crud _crud = Crud();

  OrderNumberCubit() : super(OrderNumberInitial());

  Future<void> fetchOrders() async {
    emit(OrderNumberLoading());
    try {
      final response = await _crud.getRequest(linkOrders);
      if (response.containsKey("data")) {
        if (kDebugMode) {
          print(response["data"]);
        }
        emit(OrderNumberSuccess(orderNumber: response["data"]));
        return response["data"];
      } else {
        emit(OrderNumberFailure(errMessage: response.entries.toString()));
        if (kDebugMode) {
          print(response.entries.toString());
        }
      }
    } catch (e) {
      emit(OrderNumberFailure(errMessage: e.toString()));
    }
  }
}
