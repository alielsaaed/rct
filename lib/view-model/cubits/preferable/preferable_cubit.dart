import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rct/constants/linkapi.dart';
import 'package:rct/view-model/services/crud.dart';

part 'preferable_state.dart';

class PreferableCubit extends Cubit<PreferableState> {
  final Crud _crud = Crud();
  PreferableCubit() : super(PreferableInitial());
  Future<void> pushPreferable(String description, File file) async {
    emit(PreferableLoading());
    try {
      var response = await _crud.postRequestWithFiles(
          linkPreferables, {"description": description}, {"file": file});
      if (response.containsKey("data")) {
        emit(PreferableSuccess());
      } else {
        emit(PreferableFailure(errMessage: response.entries.toString()));
      }
    } catch (e) {
      emit(PreferableFailure(errMessage: "$e"));
    }
  }
}
