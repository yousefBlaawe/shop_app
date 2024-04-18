import 'package:equatable/equatable.dart';

class ChangePassword extends Equatable
{
  final bool status;
  final String message;
  const ChangePassword({required this.status,required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [status];

}