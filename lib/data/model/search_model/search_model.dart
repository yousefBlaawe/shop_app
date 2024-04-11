import 'package:shop_app_clean/data/model/search_model/data/data.dart';
import 'package:shop_app_clean/data/model/search_model/data/search_data_model.dart';
import 'package:shop_app_clean/domain/entite/seach/search.dart';

class SearchModel extends Search
{
  SearchModel({required super.data, required super.status});
  factory SearchModel.fromJason(Map<String,dynamic>jason)
  {
    return SearchModel(
        data: DataModel.fromJason(jason['data']),
        status: jason['status']);
  }

}