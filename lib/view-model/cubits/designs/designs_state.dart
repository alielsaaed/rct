part of 'designs_cubit.dart';

@immutable
sealed class DesignsState {}

final class DesignsInitial extends DesignsState {}
final class DesignsSuccess extends DesignsState {
    final sketches; // Adjust the type according to your data structure

  DesignsSuccess({required this.sketches});
}
final class DesignsFailure extends DesignsState {
    String errMessage;
  DesignsFailure({required this.errMessage});
}
final class DesignsLoading extends DesignsState {}
