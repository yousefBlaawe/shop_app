import 'package:shop_app_clean/data/model/login_model/login_data_model.dart';
import 'package:shop_app_clean/domain/entite/login/login_entite.dart';

class LoginModel extends Login
{
  LoginModel({required super.dataLogin, required super.message, required super.status});
  factory LoginModel.fromJason(Map<String,dynamic>?jason)
  {
    return LoginModel(
        dataLogin: LoginDataModel.FromJason(jason?['data']),
        message: jason?['message'],
        status: jason?['status']);
  }

}