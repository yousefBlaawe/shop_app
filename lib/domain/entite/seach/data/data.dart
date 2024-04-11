import 'package:equatable/equatable.dart';

import 'data_search.dart';

class Data extends Equatable
{
  final List<SearchData> searchData;
  Data({required this.searchData});

  @override
  // TODO: implement props
  List<Object?> get props => [searchData];

}