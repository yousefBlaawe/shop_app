import 'package:equatable/equatable.dart';

class Favorites extends Equatable
{
  final bool status ;
  final String message;

  const Favorites({required this.status,required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [status];

}