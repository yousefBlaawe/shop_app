import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/base_use_case/base_use_case.dart';
import 'package:shop_app_clean/core/exceptions/failuer.dart';
import 'package:shop_app_clean/domain/entite/favorites/favorites.dart';
import 'package:shop_app_clean/domain/repository/base_shop_repository.dart';

class FavoritesUseCase extends BaseUseCase<Favorites,FavoritesParameter>{
  BaseShopRepository baseShopRepository;
  FavoritesUseCase(this.baseShopRepository);
  @override
  Future<Either<Failure, Favorites>> call(Parameter)async {
    return await baseShopRepository.getFavoritesDate(Parameter);
  }

}
class FavoritesParameter
{
  final int id;
  FavoritesParameter(this.id);
}