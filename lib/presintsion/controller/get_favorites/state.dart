

import '../../../domain/entite/get_favorites/get_favorites.dart';

abstract class GetFavoritesDataProductsState {}
class IntState extends GetFavoritesDataProductsState{}
class SuccessGetFavoritesData extends GetFavoritesDataProductsState{
  final GetFavorites getFavorites;
  SuccessGetFavoritesData({required this.getFavorites});
}
class ServerErrorGetFavoritesData extends GetFavoritesDataProductsState{
  final String error;
  ServerErrorGetFavoritesData({required this.error});
}
class ErrorGetFavoritesData extends GetFavoritesDataProductsState{}