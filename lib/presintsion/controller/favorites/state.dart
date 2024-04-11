import 'package:shop_app_clean/domain/entite/favorites/favorites.dart';

abstract class FavoritesState{}
class IntFavoritesState extends FavoritesState{}
class SuccessGetFavoritesState extends FavoritesState{
  Favorites favorites;
  SuccessGetFavoritesState({required  this.favorites});
}
class ChangeFavoritesIcon extends FavoritesState{}
class ServerErrorGetFavoritesState extends FavoritesState {
  final String error;
  ServerErrorGetFavoritesState({required this.error});
}
class ErrorGetFavoritesState extends FavoritesState{}