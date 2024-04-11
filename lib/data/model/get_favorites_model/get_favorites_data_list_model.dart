import 'package:shop_app_clean/data/model/get_favorites_model/get_favorites_data_products_model.dart';
import 'package:shop_app_clean/domain/entite/get_favorites/get_favorites_data_list.dart';
import 'package:shop_app_clean/domain/entite/get_favorites/get_favorites_data_products.dart';

class GetFavoritesDataListModel extends GetFavoritesDataList
{
  GetFavoritesDataListModel({required super.getFavoritesDataproducts});
  factory GetFavoritesDataListModel.fromJason(Map<String,dynamic>jason)
  {
    return GetFavoritesDataListModel(getFavoritesDataproducts: GetFavoritesDataProductsModel.fromJason(jason['product']));
  }
}