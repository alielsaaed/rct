import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rct/constants/linkapi.dart';
import 'package:rct/model/auth/register_model.dart';
import 'package:rct/view-model/functions/snackbar.dart';
import 'package:rct/view-model/services/crud.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final Crud _crud = Crud();

  Future<void> signup(RegisterModel registerModel, BuildContext context) async {
    emit(RegisterLoading());
    try {
      print("njjndsnajnjkdasnjkds");
      var respone = await _crud.postRequestWithFiles(
        linkSignup,
        {
          "email": registerModel.email,
          "password": registerModel.password,
          "name": registerModel.name,
          "phone": 00,
        },
        {"image": registerModel.image!},
      );
      if (respone.containsKey("data")) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailed(errMessage: respone.entries.toString()));
      }
      print(respone);
    } catch (e) {
      if (kDebugMode) {
        print("Resgister: $e");
      }
      emit(RegisterFailed(errMessage: e.toString()));
      throw Exception("error in registertion ops: $e");
    }
  }
}
