import 'package:shop_app_clean/data/model/login_model/login_model.dart';
import 'package:shop_app_clean/domain/entite/login/login_entite.dart';

abstract class StateLogin{}
class InitLoginState extends StateLogin{}
class LoadingState extends StateLogin{}
class ServerExceptionState extends StateLogin{
  final String errorMessage ;
  ServerExceptionState(this.errorMessage);
}
class ErrorLoginState extends StateLogin{
  final String errorMessage;
  ErrorLoginState(this.errorMessage);
}
class SuccessLoginState extends StateLogin{
  Login loginModel;
  SuccessLoginState(this.loginModel);
}
class ShowPasswordState extends StateLogin{}
