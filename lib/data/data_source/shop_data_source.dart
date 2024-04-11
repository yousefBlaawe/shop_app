import 'package:shop_app_clean/core/app_constante/app_const.dart';
import 'package:shop_app_clean/core/error_model/error_model.dart';
import 'package:shop_app_clean/core/exceptions/exceptions.dart';
import 'package:shop_app_clean/core/utils/dio_helper.dart';
import 'package:shop_app_clean/data/model/account_model/change_password_model.dart';
import 'package:shop_app_clean/data/model/login_model/login_model.dart';
import 'package:shop_app_clean/domain/repository/base_shop_repository.dart';
import 'package:shop_app_clean/domain/use_case/change_password_use_case.dart';
import 'package:shop_app_clean/domain/use_case/favorites_use_case.dart';
import 'package:shop_app_clean/domain/use_case/login_use_case.dart';
import 'package:shop_app_clean/domain/use_case/register_use_Case.dart';
import 'package:shop_app_clean/domain/use_case/search_data_use_case.dart';
import '../model/Favorites_model/favorites_model.dart';
import '../model/categories_model/categories_model.dart';
import '../model/get_favorites_model/get_favorites_model.dart';
import '../model/home_model/home_model.dart';
import '../model/register_model/register_model.dart';
import '../model/search_model/search_model.dart';

abstract class BaseShopDataSource
{
  Future<LoginModel?>getLoginData(LoginParameter loginParameter);
  Future<RegisterModel?>getRegisterData(RegisterParameter registerParameter);
  Future<HomeModel>getHomeData();
  Future<SearchModel>getSearchData(SearchParameter searchParameter);
  Future<FavoritesModel>getFavoritesDate(FavoritesParameter favoritesParameter);
  Future<GetFavoritesModel>getFavoritesDataProducts();
  Future<CategoriesModel>getCategoriesData();
  Future<ChangePasswordModel>getChangePassword(ChangePasswordParameter changePasswordParameter);
}
class ShopDataSource extends BaseShopDataSource
{

  @override
  Future<LoginModel?> getLoginData( parameter)async {
    final response=await DioHelper.postData(path: AppConst.login, data:{
      'email':parameter.email,
      'password':parameter.password,
    } );
    if (response?.statusCode==200) {

      return LoginModel.fromJason(response?.data);
    }
    else
      {
        throw ServerException(errorModel: ErrorModel?.fromJason(response?.data));
      }
  }

  @override
  Future<RegisterModel?> getRegisterData( registerParameter)async {
    final response=await DioHelper.postData(path: AppConst.register,data: {
      'name':registerParameter.name,
      'phone':registerParameter.phone,
      'email':registerParameter.email,
      'password':registerParameter.password,
      'image':AppConst.image,
    });
    print('get datasource');
    if (response?.statusCode == 200) {
      return RegisterModel.fromJason(response?.data);
    }
    else
      {
        throw ServerException(errorModel: ErrorModel?.fromJason(response?.data));
      }
  }

  @override
  Future<HomeModel> getHomeData()async {
   final result =await DioHelper.getData(url:AppConst.home );
   if (result.statusCode ==200) {
     return HomeModel.fromJason(result.data);
   }
   else
     {
       throw ServerException(errorModel: ErrorModel?.fromJason(result?.data));
     }
  }

  @override
  Future<SearchModel> getSearchData(SearchParameter searchParameter)async {
    final result=await DioHelper.postData(path: AppConst.search,
        data:{
      'text':searchParameter.searchText,
        }
        );
    if (result?.statusCode ==200) {
      return SearchModel.fromJason(result!.data);
    }
    else
      {
        throw ServerException(errorModel:ErrorModel.fromJason(result?.data));
      }
  }

  @override
  Future<FavoritesModel> getFavoritesDate(FavoritesParameter favoritesParameter) async{
    final result=await DioHelper.postData(path: AppConst.favorites, data: {'product_id':favoritesParameter.id},token: AppConst.token);
    if (result?.statusCode==200) {
      print('${result!.data} favorites');
      return FavoritesModel.fromJason(result?.data);
    }
    else
      {

        throw ServerException(errorModel: ErrorModel.fromJason(result?.data));
      }
  }

  @override
  Future<GetFavoritesModel> getFavoritesDataProducts()async {
   final result=await DioHelper.getData(url: AppConst.favorites,token: AppConst.token);
   print(result.toString() + 'get favorites');
   if (result.statusCode==200) {
     print('success get data');
     return GetFavoritesModel.fromJason(result?.data);
   }
   else
     {
       throw ServerException(errorModel:ErrorModel.fromJason(result.data));
     }
  }

  @override
  Future<CategoriesModel> getCategoriesData()async {
  final result=await  DioHelper.getData(url: AppConst.categories);
  if (result.statusCode ==200) {
    return CategoriesModel.fromJason(result.data);
  }
  else
    {
      throw ServerException(errorModel:ErrorModel.fromJason(result.data));
    }
  }

  @override
  Future<ChangePasswordModel> getChangePassword(ChangePasswordParameter changePasswordParameter)async {
    final result=await DioHelper.postData(path: AppConst.changePassword,
        data: {
      'current_password':changePasswordParameter.currentPassword,
          'new_password':changePasswordParameter.nowPassword,
        },token: AppConst.token);
    if (result!.statusCode==200) {
      return ChangePasswordModel.fromJason(result.data);
    }
    else
      {
        throw ServerException(errorModel:ErrorModel.fromJason(result.data));
      }
  }

}

