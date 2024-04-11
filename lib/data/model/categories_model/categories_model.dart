import 'package:shop_app_clean/domain/entite/categories/categories.dart';
import 'package:shop_app_clean/domain/entite/categories/categories_data.dart';

import 'categories_data_model.dart';

class CategoriesModel extends Categories
{
  CategoriesModel({required super.categoriesData, required super.status});
  factory CategoriesModel.fromJason(Map<String,dynamic>jason)
  {
    return CategoriesModel(categoriesData: CategoriesDataModel.fromJaon(jason['data']), status: jason['status']);
  }
}
// {
// "status": true,
// "message": null,
// "data": {
// "current_page": 1,
// "data": [
// {
// "id": 44,
// "name": "electrionic devices",
// "image": "https://student.valuxapps.com/storage/uploads/categories/16893929290QVM1.modern-devices-isometric-icons-collection-with-sixteen-isolated-images-computers-periphereals-variou.jpeg"
// },
// {
// "id": 43,
// "name": "Prevent Corona",
// "image": "https://student.valuxapps.com/storage/uploads/categories/1630142480dvQxx.3658058.jpg"
// },
// {
// "id": 42,
// "name": "sports",
// "image": "https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg"
// },
// {
// "id": 40,
// "name": "Lighting",
// "image": "https://student.valuxapps.com/storage/uploads/categories/16445230161CiW8.Light bulb-amico.png"
// },
// {
// "id": 46,
// "name": "Clothes",
// "image": "https://student.valuxapps.com/storage/uploads/categories/1644527120pTGA7.clothes.png"
// }
// ],
// "first_page_url": "https://student.valuxapps.com/api/categories?page=1",
// "from": 1,
// "last_page": 1,
// "last_page_url": "https://student.valuxapps.com/api/categories?page=1",
// "next_page_url": null,
// "path": "https://student.valuxapps.com/api/categories",
// "per_page": 35,
// "prev_page_url": null,
// "to": 5,
// "total": 5
// }
// }