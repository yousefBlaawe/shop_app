import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/base_use_case/base_use_case.dart';
import 'package:shop_app_clean/core/exceptions/failuer.dart';
import 'package:shop_app_clean/domain/entite/account/change_password.dart';
import 'package:shop_app_clean/domain/repository/base_shop_repository.dart';

class ChangePasswordUseCase extends BaseUseCase<ChangePassword,ChangePasswordParameter>
{
  BaseShopRepository baseShopRepository;
  ChangePasswordUseCase(this.baseShopRepository);

  @override
  Future<Either<Failure, ChangePassword>> call( changePasswordParameter)async {
    return await baseShopRepository.getChangePassword(changePasswordParameter);
  }

}
class ChangePasswordParameter
{
  final String currentPassword;
  final String nowPassword;
  ChangePasswordParameter({required this.currentPassword,required this.nowPassword});
}