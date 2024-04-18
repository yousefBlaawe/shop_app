import 'package:shop_app_clean/domain/entite/favorites/favorites.dart';

class FavoritesModel extends Favorites
{
  const FavoritesModel({required super.status, required super.message});
  factory FavoritesModel.fromJason(Map<String,dynamic>?jason)
  {
    return FavoritesModel(status: jason?['status'], message: jason?['message']);
  }
}