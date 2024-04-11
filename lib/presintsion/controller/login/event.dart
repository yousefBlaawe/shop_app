
abstract class LoginEvent{}
class EventLogin extends LoginEvent
{
  final String email;
  final String pasword;
  EventLogin({required this.email,required this.pasword});
}
class EventShowPassword extends LoginEvent {}