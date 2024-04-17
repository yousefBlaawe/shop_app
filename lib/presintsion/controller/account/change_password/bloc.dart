import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/presintsion/controller/account/change_password/event.dart';
import 'package:shop_app_clean/presintsion/controller/account/change_password/state.dart';

import '../../../../domain/use_case/change_password_use_case.dart';

class BlocChangePassword extends Bloc<ChangePasswordEvent,ChangePasswordState>
{
  var currentPasswordController=TextEditingController();
  var newPasswordController=TextEditingController();
  ChangePasswordUseCase changePasswordUseCase;
  static BlocChangePassword getObject(context)
  {
    return BlocProvider.of(context);
  }
  BlocChangePassword(this.changePasswordUseCase):super(IntState()){
    on<ChangePasswordEvent>((event, emit) async{
      final result=await changePasswordUseCase.call(ChangePasswordParameter(currentPassword: event.currentPassword, nowPassword: event.newPassword));
      result.fold((l) => emit(ServerErrorChangePasswordState(error: l.message)),
              (r) {
        if (r.status) {
          emit(SuccessChangePasswordState(changePassword: r));
        }
        else
          {
            emit(ErrorChangePasswordState(changePassword: r));
          }
              });
    });
  }
}