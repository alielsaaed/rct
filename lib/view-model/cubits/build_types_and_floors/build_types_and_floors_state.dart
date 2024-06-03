part of 'build_types_and_floors_cubit.dart';

@immutable
sealed class BuildTypesAndFloorsState {}

final class BuildTypesAndFloorsInitial extends BuildTypesAndFloorsState {}

final class BuildTypesAndFloorsLoading extends BuildTypesAndFloorsState {}

final class BuildTypesAndFloorsFailure extends BuildTypesAndFloorsState {
  String errMessage;
  BuildTypesAndFloorsFailure({required this.errMessage});
}

final class BuildTypesAndFloorsSuccess extends BuildTypesAndFloorsState {
  List<BuildTypesModel> buildTypes;
  BuildTypesAndFloorsSuccess({required this.buildTypes});
}
