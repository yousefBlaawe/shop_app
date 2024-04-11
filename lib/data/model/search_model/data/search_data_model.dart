import 'package:shop_app_clean/domain/entite/seach/data/data_search.dart';

class SearchDataModel extends SearchData
{
  SearchDataModel({required super.price, required super.image, required super.id,required super.name});
  factory SearchDataModel.fromJason(Map<String ,dynamic>jason)
  {
    return SearchDataModel(
        price: jason['price'] +0.0,
        image: jason['image'],
        id: jason['id'],
        name: jason['name'],
    );
  }
}