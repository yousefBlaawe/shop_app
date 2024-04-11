import 'package:shop_app_clean/domain/entite/seach/search.dart';

abstract class SearchDataState {}
class IntSearchState extends SearchDataState{}
class SuccessSearchState extends SearchDataState{
  final Search search;
  SuccessSearchState({required this.search});
}
class ErrorServerState extends SearchDataState{
  final String error;
  ErrorServerState({required this.error});
}
class ErrorSearchState extends SearchDataState{}
class LoadingSearchState extends SearchDataState{}
class ZeroStateData extends SearchDataState{}