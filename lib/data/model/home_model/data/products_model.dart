import 'package:shop_app_clean/domain/entite/home/data/products.dart';

class ProductsModel extends Products
{
  const ProductsModel({required super.image, required super.id, required super.name, required super.discount, required super.description, required super.oldPrice, required super.price,required super.favorites});
  factory ProductsModel.fromJason(Map<String ,dynamic>?jason)
  {
    return ProductsModel(
        image: jason?['image'],
        id: jason?['id'],
        name: jason?['name'],
        discount: jason?['discount'],
        description: jason?['description'],
        oldPrice:jason?['old_price'] +0.0,
        price: jason?['price']+0.0,
        favorites: jason?['in_favorites']);
  }

}