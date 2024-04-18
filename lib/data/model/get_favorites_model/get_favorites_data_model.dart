import 'package:shop_app_clean/data/model/get_favorites_model/get_favorites_data_list_model.dart';
import 'package:shop_app_clean/domain/entite/get_favorites/get_favorites_data.dart';

class GetFavoritesDataModel extends GetFavoritesData
{
  const GetFavoritesDataModel({required super.dataList});
  factory GetFavoritesDataModel.fromJason(Map<String ,dynamic>jason)
  {
    return GetFavoritesDataModel(dataList: List<GetFavoritesDataListModel>.from((jason['data'] as List).map((e) => GetFavoritesDataListModel.fromJason(e))));
  }
}