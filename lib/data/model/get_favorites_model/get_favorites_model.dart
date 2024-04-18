import 'package:shop_app_clean/data/model/get_favorites_model/get_favorites_data_model.dart';
import 'package:shop_app_clean/domain/entite/get_favorites/get_favorites.dart';

class GetFavoritesModel extends GetFavorites
{
  const GetFavoritesModel({required super.getFavoritesData, required super.status});
  factory GetFavoritesModel.fromJason(Map<String,dynamic>jason)
  {
    return GetFavoritesModel(getFavoritesData: GetFavoritesDataModel.fromJason(jason['data']), status: jason['status']);
  }
}