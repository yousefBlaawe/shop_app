import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/base_use_case/base_use_case.dart';
import 'package:shop_app_clean/core/exceptions/failuer.dart';
import 'package:shop_app_clean/domain/entite/register/register.dart';
import 'package:shop_app_clean/domain/repository/base_shop_repository.dart';

class ShopRegisterUseCase extends BaseUseCase<Register?,RegisterParameter>
{
  BaseShopRepository baseShopRepository;
  ShopRegisterUseCase(this.baseShopRepository);

  @override
  Future<Either<Failure, Register?>> call( Parameter)async {
    return await baseShopRepository.getRegisterDate(Parameter);
  }

}
class RegisterParameter
{
  final String name;
  final String password;
  final String email;
  final String phone;
  RegisterParameter({required this.email,required this.name,required this.phone,required this.password});

}