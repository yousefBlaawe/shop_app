import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/domain/use_case/register_use_Case.dart';
import 'package:shop_app_clean/presintsion/controller/register/event.dart';
import 'package:shop_app_clean/presintsion/controller/register/state.dart';

import '../../../core/app_constante/app_const.dart';
import '../../../core/utils/cash_helper.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>
{
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  static RegisterBloc getObject(context)
  {
    return BlocProvider.of(context);
  }
  ShopRegisterUseCase registerShopUseCase;
  RegisterBloc(this.registerShopUseCase):super(InteRegisterState()){
    on<RegisterEvent>(_getRegisterData );
  }

  FutureOr<void>_getRegisterData(RegisterEvent event,Emitter<RegisterState>emit)async{
    final result=await registerShopUseCase.call(RegisterParameter(
        email: event.email,
        name: event.name,
        phone: event.phone,
        password: event.password));

    emit(LoadingRegisterState());
     result.fold(
            (l) =>emit(ServerRegisterError(l.message)),
            (r) {
              if (r!.status) {
                AppConst.token=r.registerData!.token!;
                cachHelper.SaveData(key: 'name', val: r.registerData!.name);
                cachHelper.SaveData(key: 'id', val: r.registerData!.id);
                cachHelper.SaveData(key: 'email', val: r.registerData!.email);
                cachHelper.SaveData(key: 'phone', val: r.registerData!.phone);
                emit (SuccessRegisterState(r));
              }
              else
                {
                  emit(ErrorRegisterState(r.message));
                }
            });
  }
}
