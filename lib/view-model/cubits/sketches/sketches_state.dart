part of 'sketches_cubit.dart';

@immutable
sealed class SketchesState {}

final class SketchesInitial extends SketchesState {}

final class SketchesLoading extends SketchesState {}

final class SketchesSuccess extends SketchesState {
  final sketches; // Adjust the type according to your data structure

  SketchesSuccess({required this.sketches});
}

final class SketchesFailure extends SketchesState {
  String errMessage;
  SketchesFailure({required this.errMessage});
}
