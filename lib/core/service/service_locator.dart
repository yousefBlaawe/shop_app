import 'package:get_it/get_it.dart';
import 'package:shop_app_clean/data/data_source/shop_data_source.dart';
import 'package:shop_app_clean/data/repository/shop_repository.dart';
import 'package:shop_app_clean/domain/repository/base_shop_repository.dart';
import 'package:shop_app_clean/domain/use_case/categories_use_case.dart';
import 'package:shop_app_clean/domain/use_case/change_password_use_case.dart';
import 'package:shop_app_clean/domain/use_case/favorites_use_case.dart';
import 'package:shop_app_clean/domain/use_case/gat_favorites_use_case.dart';
import 'package:shop_app_clean/domain/use_case/home_data_use_case.dart';
import 'package:shop_app_clean/domain/use_case/register_use_Case.dart';
import 'package:shop_app_clean/domain/use_case/search_data_use_case.dart';
import 'package:shop_app_clean/presintsion/controller/account/change_password/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/categories/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/favorites/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/get_favorites/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/login/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/productes/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/register/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/search/bloc.dart';

import '../../domain/use_case/login_use_case.dart';

final SL=GetIt.instance;
class ServiceLocator {
  void init(){
    //Bloc
    SL.registerFactory(() =>BlocLogin(SL()) );
    SL.registerFactory(() => RegisterBloc(SL()));
    SL.registerFactory(() => HomeProductsBloc(SL()));
    SL.registerFactory(() => BlocSearch(SL()));
    SL.registerFactory(() => FavoritesBloc(SL()));
    SL.registerFactory(() => GetFavoritesBloc(SL()));
    SL.registerFactory(() => CategoriesBloc(SL()));
    SL.registerFactory(() => BlocChangePassword(SL()));
    //UseCase
    SL.registerLazySingleton(() => LoginShopUeCase(SL()));
    SL.registerLazySingleton(() => HomeDataUseCae(SL()));
    SL.registerLazySingleton(() => ShopRegisterUseCase(SL()));
    SL.registerLazySingleton(() => SearchDataUseCase(SL()));
    SL.registerLazySingleton(() => FavoritesUseCase(SL()));
    SL.registerLazySingleton(() => GetFavoritesUseCase(SL()));
    SL.registerLazySingleton(() => CategoriesUseCase(SL()));
    SL.registerLazySingleton(() => ChangePasswordUseCase(SL()));
    //Repository
    SL.registerLazySingleton<BaseShopRepository>(() => ShopRepository(SL()));
    //DataSource
    SL.registerLazySingleton<BaseShopDataSource>(() => ShopDataSource());
  }
}