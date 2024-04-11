import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/base_use_case/base_use_case.dart';
import 'package:shop_app_clean/core/exceptions/failuer.dart';
import 'package:shop_app_clean/domain/entite/home/home.dart';
import 'package:shop_app_clean/domain/repository/base_shop_repository.dart';

class HomeDataUseCae extends BaseUseCase<Home,NoParameter>
{
  BaseShopRepository baseShopRepository;
  HomeDataUseCae(this.baseShopRepository);
  @override
  Future<Either<Failure, Home>> call(Parameter)async {
    return await baseShopRepository.getHomeData();
  }

}
