import 'package:equatable/equatable.dart';
import 'package:shop_app_clean/domain/entite/home/data/home_data.dart';

class Home extends Equatable
{
  final bool status;
  final HomeData? homeData;
  const Home({required this.homeData,required this.status});

  @override
  // TODO: implement props
  List<Object?> get props => [status,homeData];

}