import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rct/constants/linkapi.dart';
import 'package:rct/view-model/services/crud.dart';

part 'sketches_state.dart';

class SketchesCubit extends Cubit<SketchesState> {
  final Crud _crud = Crud();

  SketchesCubit() : super(SketchesInitial());

  Future<void> loadSketches(BuildContext context) async {
    emit(SketchesLoading());
    try {
      final response = await _crud.getRequest(linkSketches);
      if (response.containsKey("data")) {
        if (kDebugMode) {
          print(response["data"]);
        }
        emit(SketchesSuccess(sketches: response["data"]));
        return response["data"];
      } else {
        emit(SketchesFailure(errMessage: response.entries.toString()));
        if (kDebugMode) {
          print(response.entries.toString());
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(SketchesFailure(errMessage: "$e"));
    }
  }

}
