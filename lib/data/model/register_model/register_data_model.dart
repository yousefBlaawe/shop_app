import 'package:shop_app_clean/domain/entite/register/register_data.dart';

class RegisterDataModel extends RegisterData
{
  RegisterDataModel({required super.phone, required super.name, required super.token, required super.email, required super.id});
  factory RegisterDataModel.fromJason(Map<String ,dynamic>?jason)
  {
    return RegisterDataModel(
        phone: jason?['phone'],
        name: jason?['name'],
        token: jason?['token'],
        email: jason?['email'],
        id: jason?['id']);
  }
}