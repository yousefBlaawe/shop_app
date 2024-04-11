import 'package:shop_app_clean/data/model/categories_model/categories_data_model.dart';
import 'package:shop_app_clean/domain/entite/categories/categories_data_list.dart';

class CategoriesDataListModel extends CategoriesDataList
{
  CategoriesDataListModel({required super.image, required super.name});
  factory CategoriesDataListModel.formJaon(Map<String,dynamic>jason)
  {
    return CategoriesDataListModel(image: jason['image'], name: jason['name']);
  }
}