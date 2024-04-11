import '../../../domain/entite/register/register.dart';

abstract class RegisterState {}
class InteRegisterState extends RegisterState{}
class LoadingRegisterState extends RegisterState{}
class SuccessRegisterState extends RegisterState{
  final Register register;
  SuccessRegisterState(this.register);
}
class ErrorRegisterState extends RegisterState {
  final String errorRegisterMessage ;
  ErrorRegisterState(this.errorRegisterMessage);
}
class ServerRegisterError extends RegisterState{
  final String errorServerMessage;
  ServerRegisterError(this.errorServerMessage);
}