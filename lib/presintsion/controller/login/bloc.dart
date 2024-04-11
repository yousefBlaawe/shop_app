import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/presintsion/controller/login/event.dart';
import 'package:shop_app_clean/presintsion/controller/login/state.dart';

import '../../../domain/use_case/login_use_case.dart';

class BlocLogin extends Bloc<LoginEvent,StateLogin> {
  bool showPassword=true;
  IconData iconPassword=Icons.remove_red_eye;
  LoginShopUeCase loginShopUseCase;
  static BlocLogin getObject(context)
  {
    return BlocProvider.of(context);
  }
  BlocLogin(this.loginShopUseCase) :super(InitLoginState()) {
    on<EventLogin>(_getLoginDate);
    on<EventShowPassword>(_getShowPassword);
  }

  FutureOr<void>_getLoginDate(EventLogin event,Emitter<StateLogin>state) async {
    emit(LoadingState());
    final result = await loginShopUseCase.call(LoginParameter(
        email: event.email,
        password: event.pasword));
    result.fold(
            (l) => emit(ServerExceptionState(l.message)),
            (r) {
          if (r!.status == true) {
            emit(SuccessLoginState(r));
            print(r.dataLogin);
          }
          else {
            print(r.dataLogin);
            emit(ErrorLoginState(r.message));
          }
        });
  }
  void _getShowPassword(EventShowPassword event,Emitter emit) {
    showPassword=!showPassword;
    if (showPassword) {
      iconPassword=Icons.remove_red_eye;
    }
    else
      {
        iconPassword=Icons.remove_red_eye_outlined;
      }
    emit(ShowPasswordState());
  }
}