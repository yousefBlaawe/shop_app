import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/base_use_case/base_use_case.dart';
import 'package:shop_app_clean/core/exceptions/failuer.dart';
import 'package:shop_app_clean/domain/entite/categories/categories.dart';
import 'package:shop_app_clean/domain/repository/base_shop_repository.dart';

class CategoriesUseCase extends BaseUseCase<Categories,NoParameter>
{
  BaseShopRepository baseShopRepository;
  CategoriesUseCase(this.baseShopRepository);
  @override
  Future<Either<Failure, Categories>> call(Parameter)async {
   return await baseShopRepository.getCategoriesData();
  }

}