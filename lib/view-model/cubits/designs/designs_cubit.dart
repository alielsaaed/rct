import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rct/constants/linkapi.dart';
import 'package:rct/view-model/services/crud.dart';

part 'designs_state.dart';

class DesignsCubit extends Cubit<DesignsState> {
  final Crud _crud = Crud();
  DesignsCubit() : super(DesignsInitial());

  Future loadDesigns(BuildContext context) async {
    emit(DesignsLoading());
    try {
      final response = await _crud.getRequest(linkDesign);
      if (response.containsKey("data")) {
        if (kDebugMode) {
          // print(response["data"]);
        }
        emit(DesignsSuccess(sketches: response["data"]));
        return response["data"];
      } else {
        emit(DesignsFailure(errMessage: response.entries.toString()));
        if (kDebugMode) {
          print(response.entries.toString());
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(DesignsFailure(errMessage: "$e"));
    }
  }
}
