import 'package:shop_app_clean/domain/entite/categories/categories.dart';

abstract class CategoriesState{}
class IntState extends CategoriesState{}
class SuccessCategoriesState extends CategoriesState{
  final Categories categories;
  SuccessCategoriesState({required this.categories});
}
class ServerErrorCategoriesState extends CategoriesState{
  final String error ;
  ServerErrorCategoriesState({required this.error});
}
class ErrorCategoriesState extends CategoriesState{}