import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_clean/core/exceptions/failuer.dart';

abstract class BaseUseCase <T,Parameter>
{
  Future<Either<Failure,T>>call(Parameter);
}
class NoParameter extends Equatable
{
   const NoParameter();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}