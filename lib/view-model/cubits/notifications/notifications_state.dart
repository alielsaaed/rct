part of 'notifications_cubit.dart';

@immutable
sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsSuccess extends NotificationsState {
  final notifications;
  String orderNumber;
  NotificationsSuccess({required this.notifications, this.orderNumber = ""});
}

final class NotificationsLoading extends NotificationsState {}

final class NotificationsFailure extends NotificationsState {
  final String errMessage;
  NotificationsFailure({required this.errMessage});
}
