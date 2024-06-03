import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rct/model/auth/login_model.dart';
import 'package:rct/constants/linkapi.dart';
import 'package:rct/main.dart';
import 'package:rct/view-model/services/crud.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Crud _crud = Crud();
  LoginCubit() : super(LoginInitial());

  Future<void> login(LoginModel loginModel, BuildContext context) async {
    emit(LoginLoading());
    try {
      final response = await _crud.loginPostRequest(linkLogin, loginModel);
      if (response.containsKey("token")) {
        secureStorage.write(key: "token", value: response["token"]);
        if (kDebugMode) {
          print("${response["token"]}");
        }
        emit(LoginSuccess());
      } else {
        emit(LoginFailed(errMessage: response.toString()));
      }
    } catch (e) {
      emit(LoginFailed(errMessage: "$e"));
    }
  }
}
