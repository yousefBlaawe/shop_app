import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/presintsion/controller/login/event.dart';
import 'package:shop_app_clean/presintsion/controller/login/state.dart';
import '../../../core/app_constante/app_const.dart';
import '../../../core/utils/cash_helper.dart';
import '../../../domain/use_case/login_use_case.dart';

class BlocLogin extends Bloc<LoginEvent,StateLogin> {
  /////////////////Controllers///////////////////////
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  /////////////////Others///////////////////////
  bool showPassword=true;
  IconData iconPassword=Icons.remove_red_eye;
  ////////////////Use Case///////////////////
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
            AppConst.token=r.dataLogin!.token;
            cachHelper.SaveData(key: 'name', val: r.dataLogin!.name);
            cachHelper.SaveData(key: 'id', val: r.dataLogin!.id);
            cachHelper.SaveData(key: 'email', val: r.dataLogin!.email);
            cachHelper.SaveData(key: 'phone', val: r.dataLogin!.phone);
            emit(SuccessLoginState(r));

          }
          else {

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