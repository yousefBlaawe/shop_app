import '../../../domain/entite/get_favorites/get_favorites_data_products.dart';

class GetFavoritesDataProductsModel extends GetFavoritesDataProducts
{
  GetFavoritesDataProductsModel({required super.name, required super.image, required super.price});
  factory GetFavoritesDataProductsModel.fromJason(Map<String,dynamic>jason)
  {
    return GetFavoritesDataProductsModel(name: jason['name'], image: jason['image'], price: jason['price']+0.0);
  }
}