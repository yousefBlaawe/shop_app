

import 'package:shop_app_clean/domain/entite/home/home.dart';

class HomeProductsState {}
class IntState extends HomeProductsState{}
class SuccessGetData extends HomeProductsState{
  Home home;
  SuccessGetData({required this.home});
}
class ServerFailGetData extends HomeProductsState{
  final String serverError ;
  ServerFailGetData({required this.serverError});
}
class LoadingGetData extends HomeProductsState{}
class ErrorGetDate extends HomeProductsState{

}
class SuccessChangeFavoritesData extends HomeProductsState{}
class ErrorServerChangeFavorites extends HomeProductsState{
  final String error;
  ErrorServerChangeFavorites({required this.error});
}
class FailChangeFavoritesData extends HomeProductsState{}