import 'package:equatable/equatable.dart';

class RegisterEvent extends Equatable
{
  final String name;
  final String email;
  final String password;
  final String phone;
  const RegisterEvent({required this.email,required this.phone,required this.name,required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email,password,phone,name];

}
