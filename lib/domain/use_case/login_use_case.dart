import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_clean/core/base_use_case/base_use_case.dart';
import 'package:shop_app_clean/domain/entite/login/login_entite.dart';
import 'package:shop_app_clean/domain/repository/base_shop_repository.dart';

import '../../core/exceptions/failuer.dart';

class LoginShopUeCase extends BaseUseCase<Login?,LoginParameter>
{
  BaseShopRepository baseShopRepository;
  LoginShopUeCase(this.baseShopRepository);

  @override
  Future<Either<Failure,Login?>> call(Parameter)async {
    print('get use case');
    return await baseShopRepository.getLoginData(Parameter);
  }



}
class LoginParameter extends Equatable
{
  final String email;
  final String password;
  LoginParameter({required this.email,required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];

}