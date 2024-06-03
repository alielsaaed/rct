import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:rct/constants/linkapi.dart';
import 'package:rct/view-model/services/crud.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final Crud _crud = Crud();

  NotificationsCubit() : super(NotificationsInitial());

  Future<void> fetchNotifications() async {
    emit(NotificationsLoading());
    try {
      final response = await _crud.getRequest(linkNotificationsi);
      if (response.containsKey("data")) {
        if (kDebugMode) {
          print(response["data"]);
        }
        emit(
          NotificationsSuccess(
            notifications: response["data"],
          ),
        );
        return response["data"];
      } else {
        emit(NotificationsFailure(errMessage: response.entries.toString()));
        if (kDebugMode) {
          print(response.entries.toString());
        }
      }
    } catch (e) {
      emit(NotificationsFailure(errMessage: e.toString()));
    }
  }

  Future<void> fetchOrderNumber(id) async {
    // emit(NotificationsLoading());
    try {
      final response = await _crud.getRequest(linkOrders);
      if (response.containsKey("data")) {
        if (kDebugMode) {
          print(response["data"]);
        }

        final order = response["data"].firstWhere(
          (item) => item["id"] == id,
          orElse: () => null,
        );

        if (order != null) {
          // emit(NotificationsSuccess(notifications: order["number"]));
          return order["number"];
        } else {
          // emit(NotificationsFailure(errMessage: "Order not found"));
          if (kDebugMode) {
            print("Order not found");
          }
        }
      } else {
        emit(NotificationsFailure(errMessage: response.entries.toString()));
        if (kDebugMode) {
          print(response.entries.toString());
        }
      }
    } catch (e) {
      // emit(NotificationsFailure(errMessage: e.toString()));
    }
  }
}
