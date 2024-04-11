import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/exceptions/exceptions.dart';
import 'package:shop_app_clean/core/exceptions/failuer.dart';
import 'package:shop_app_clean/data/data_source/shop_data_source.dart';
import 'package:shop_app_clean/domain/entite/account/change_password.dart';
import 'package:shop_app_clean/domain/entite/categories/categories.dart';
import 'package:shop_app_clean/domain/entite/favorites/favorites.dart';

import 'package:shop_app_clean/domain/entite/get_favorites/get_favorites.dart';
import 'package:shop_app_clean/domain/entite/home/home.dart';
import 'package:shop_app_clean/domain/entite/login/login_entite.dart';
import 'package:shop_app_clean/domain/entite/register/register.dart';
import 'package:shop_app_clean/domain/entite/seach/search.dart';
import 'package:shop_app_clean/domain/repository/base_shop_repository.dart';
import 'package:shop_app_clean/domain/use_case/change_password_use_case.dart';
import 'package:shop_app_clean/domain/use_case/favorites_use_case.dart';
import 'package:shop_app_clean/domain/use_case/login_use_case.dart';
import 'package:shop_app_clean/domain/use_case/register_use_Case.dart';
import 'package:shop_app_clean/domain/use_case/search_data_use_case.dart';

class ShopRepository extends BaseShopRepository
{
  final BaseShopDataSource baseShopDataSource;
  ShopRepository(this.baseShopDataSource);
  @override
  Future<Either<Failure,Login?>> getLoginData(LoginParameter loginParameter)async {
    final result=await baseShopDataSource.getLoginData(loginParameter);
    try
        {
          return Right(result!);
        }on ServerException catch(failuer)
    {
      return Left(ServerFailure(failuer.errorModel!.statusMessage!));
    }
  }

  @override
  Future<Either<Failure, Register?>> getRegisterDate(RegisterParameter registerParameter) async{
    final result=await baseShopDataSource.getRegisterData(registerParameter);
    print('get Repository');
    try{
      return Right(result);
    }on ServerException catch(failuer)
    {
      return Left(ServerFailure(failuer.errorModel!.statusMessage!));
    }
  }

  @override
  Future<Either<Failure, Home>> getHomeData() async{
    final result=await baseShopDataSource.getHomeData();
    try{
      return Right(result);
    }on ServerException catch(failuer)
    {
      return Left(ServerFailure(failuer.errorModel!.statusMessage!));
    }
  }

  @override
  Future<Either<Failure, Search>> getSearchData(SearchParameter searchParameter)async {
    final result=await baseShopDataSource.getSearchData(searchParameter);
    try{
      return Right(result);
    }on ServerException catch(failur)
    {
      return Left(ServerFailure(failur.errorModel!.statusMessage!));
    }
  }

  @override
  Future<Either<Failure, Favorites>> getFavoritesDate(FavoritesParameter favoritesParameter) async{
    final reuslt=await baseShopDataSource.getFavoritesDate(favoritesParameter);
    try
        {
         return Right(reuslt);
        }on ServerException catch(failuer)
    {
      return Left(ServerFailure(failuer.errorModel!.statusMessage!));
    }
  }

  @override
  Future<Either<Failure, GetFavorites>> getFavoritesDataProducts() async{
    final result=await baseShopDataSource.getFavoritesDataProducts();
    try{
      return Right(result);
    }on ServerException catch(failuer)
    {
      return Left(ServerFailure(failuer.errorModel!.statusMessage!));
    }
  }

  @override
  Future<Either<Failure, Categories>> getCategoriesData() async{
    final result=await baseShopDataSource.getCategoriesData();
    try{
      return Right(result);
    }on ServerException catch(failuer)
    {
      return Left(ServerFailure(failuer.errorModel!.statusMessage!));
    }
  }

  @override
  Future<Either<Failure, ChangePassword>> getChangePassword(ChangePasswordParameter changePasswordParameter)async {
  final result=await baseShopDataSource.getChangePassword(changePasswordParameter);
  try{
    return Right(result);
  }on ServerException catch(failuer)
  {
    return Left(ServerFailure(failuer.errorModel!.statusMessage!));
  }
  }

}