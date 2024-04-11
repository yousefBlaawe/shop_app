import 'package:shop_app_clean/domain/entite/categories/categories_data.dart';
import 'package:shop_app_clean/domain/entite/categories/categories_data_list.dart';

import 'categories_data_list_model.dart';

class CategoriesDataModel extends CategoriesData
{
  CategoriesDataModel({required super.categoriesDataList});
  factory CategoriesDataModel.fromJaon(Map<String,dynamic>jason)
  {
    return CategoriesDataModel(categoriesDataList: List<CategoriesDataListModel>.from((jason['data']as List).map((e) => CategoriesDataListModel.formJaon(e))));
  }
}