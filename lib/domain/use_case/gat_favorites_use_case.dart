import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/base_use_case/base_use_case.dart';
import 'package:shop_app_clean/core/exceptions/failuer.dart';

import 'package:shop_app_clean/domain/repository/base_shop_repository.dart';

import '../entite/get_favorites/get_favorites.dart';

class GetFavoritesUseCase  extends BaseUseCase<GetFavorites,NoParameter>
{
  BaseShopRepository baseShopRepository;
  GetFavoritesUseCase(this.baseShopRepository);
  @override
  Future<Either<Failure, GetFavorites>> call(Parameter)async {
   return await  baseShopRepository.getFavoritesDataProducts();
  }

}
