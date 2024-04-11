import '../../../domain/entite/home/data/products.dart';

abstract class FavoritesEvent{}
class FavoritesGetDataEvent extends FavoritesEvent{

  final int id;
  FavoritesGetDataEvent({required this.id});
}