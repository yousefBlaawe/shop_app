import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/domain/entite/login/login_entite.dart';
import 'package:shop_app_clean/domain/use_case/register_use_Case.dart';
import 'package:shop_app_clean/presintsion/controller/login/state.dart';
import 'package:shop_app_clean/presintsion/controller/register/event.dart';
import 'package:shop_app_clean/presintsion/controller/register/state.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>
{
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
    print('bloc data $result');
    emit(LoadingRegisterState());
     result.fold(
            (l) =>emit(ServerRegisterError(l.message)),
            (r) {
              if (r!.status) {
                emit (SuccessRegisterState(r));
              }
              else
                {
                  emit(ErrorRegisterState(r.message));
                }
            });
  }
}
