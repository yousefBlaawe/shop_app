import 'package:shop_app_clean/data/model/register_model/register_data_model.dart';
import 'package:shop_app_clean/domain/entite/register/register.dart';

class RegisterModel extends Register
{
  RegisterModel({required super.registerData, required super.status, required super.message});
  factory RegisterModel.fromJason(Map<String,dynamic>jason)
  {
    return RegisterModel(
        registerData: RegisterDataModel.fromJason(jason['data']),
        status: jason['status'],
        message: jason['message']);
  }
}
