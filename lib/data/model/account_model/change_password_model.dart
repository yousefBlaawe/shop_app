import 'package:shop_app_clean/domain/entite/account/change_password.dart';

class ChangePasswordModel extends ChangePassword
{
  ChangePasswordModel({required super.status,required super.message});
  factory ChangePasswordModel.fromJason(Map<String,dynamic>jason)
  {
    return ChangePasswordModel(status: jason['status'], message: jason['message']);
  }
}