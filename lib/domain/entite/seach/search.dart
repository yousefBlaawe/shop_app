import 'package:equatable/equatable.dart';

import 'data/data.dart';
import 'data/data_search.dart';

class Search extends Equatable
{
  final bool status;
  final Data data;
  const Search({required this.data,required this.status});

  @override
  // TODO: implement props
  List<Object?> get props => [status,data];


}