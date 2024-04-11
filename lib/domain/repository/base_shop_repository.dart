import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_app_clean/domain/entite/account/change_password.dart';
import 'package:shop_app_clean/domain/entite/categories/categories.dart';
import 'package:shop_app_clean/domain/entite/favorites/favorites.dart';

import 'package:shop_app_clean/domain/entite/home/home.dart';
import 'package:shop_app_clean/domain/entite/register/register.dart';
import 'package:shop_app_clean/domain/entite/seach/search.dart';
import 'package:shop_app_clean/domain/use_case/change_password_use_case.dart';
import 'package:shop_app_clean/domain/use_case/favorites_use_case.dart';
import 'package:shop_app_clean/domain/use_case/login_use_case.dart';
import 'package:shop_app_clean/domain/use_case/register_use_Case.dart';
import 'package:shop_app_clean/domain/use_case/search_data_use_case.dart';

import '../../core/exceptions/failuer.dart';
import '../entite/get_favorites/get_favorites.dart';
import '../entite/login/login_entite.dart';

abstract class BaseShopRepository
{
  Future<Either<Failure,Login?>>getLoginData(LoginParameter loginParameter);
  Future<Either<Failure,Register?>>getRegisterDate(RegisterParameter registerParameter);
  Future<Either<Failure,Home>>getHomeData();
  Future<Either<Failure,Search>>getSearchData(SearchParameter searchParameter);
  Future<Either<Failure,Favorites>>getFavoritesDate(FavoritesParameter favoritesParameter);
  Future<Either<Failure,GetFavorites>>getFavoritesDataProducts();
  Future<Either<Failure,Categories>>getCategoriesData();
  Future<Either<Failure,ChangePassword>>getChangePassword(ChangePasswordParameter changePasswordParameter);

}