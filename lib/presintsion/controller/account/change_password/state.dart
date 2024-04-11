import 'package:shop_app_clean/domain/entite/account/change_password.dart';

abstract class ChangePasswordState {}
class IntState extends ChangePasswordState{}

class SuccessChangePasswordState extends ChangePasswordState{
  final ChangePassword changePassword;
  SuccessChangePasswordState({required this.changePassword});
}
class ServerErrorChangePasswordState extends ChangePasswordState{
  final String error;
  ServerErrorChangePasswordState({required this.error});
}
class ErrorChangePasswordState extends ChangePasswordState{
  final ChangePassword changePassword;

  ErrorChangePasswordState({required this.changePassword});
}

