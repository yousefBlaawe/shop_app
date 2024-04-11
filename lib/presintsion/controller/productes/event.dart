abstract class HomeProductsEvent {}
class GetHomeProductsEvent extends HomeProductsEvent{}
class FavoritesChangeEvent extends HomeProductsEvent{
  final int id;
  FavoritesChangeEvent({required this.id});
}