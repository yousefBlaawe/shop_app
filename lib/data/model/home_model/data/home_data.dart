import 'package:shop_app_clean/data/model/home_model/data/banners_model.dart';
import 'package:shop_app_clean/data/model/home_model/data/products_model.dart';
import 'package:shop_app_clean/domain/entite/home/data/home_data.dart';

class HomeDataModel extends HomeData
{
  HomeDataModel({required super.bannersData, required super.productsData});
  factory HomeDataModel.formJason(Map<String,dynamic>?jason)
  {
    return HomeDataModel(
        bannersData: List<BannersModel>.from((jason?['banners'] as List).map((e)=>BannersModel.fromJason(e))),
        productsData: List<ProductsModel>.from((jason?['products'] as List).map((e)=>ProductsModel.fromJason(e)))
    );
  }

}