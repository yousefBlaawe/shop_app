import 'package:shop_app_clean/data/model/search_model/data/search_data_model.dart';
import 'package:shop_app_clean/domain/entite/seach/data/data.dart';

class DataModel extends Data
{
  DataModel({required super.searchData});
  factory DataModel.fromJason(Map<String,dynamic>jason)
  {
    return DataModel(
        searchData: List<SearchDataModel>.from((jason['data'] as List).map((e) => SearchDataModel.fromJason(e))));
  }


}