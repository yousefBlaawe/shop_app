import 'package:shop_app_clean/domain/entite/login/data_login.dart';

class LoginDataModel extends DataLogin
{
  const LoginDataModel({required super.email, required super.name, required super.id, required super.phone, required super.token});
  factory LoginDataModel.FromJason(Map<String,dynamic>?jason){
    return LoginDataModel(
        email: jason?['email'],
        name: jason?['name'],
        id: jason?['id'],
        phone: jason?['phone'],
        token: jason?['token']);
  }

}