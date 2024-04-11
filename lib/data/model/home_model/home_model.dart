import 'package:shop_app_clean/data/model/home_model/data/home_data.dart';
import 'package:shop_app_clean/domain/entite/home/home.dart';

class HomeModel extends Home
{
  HomeModel({required super.homeData, required super.status});
  factory HomeModel.fromJason(Map<String,dynamic>?jason){
    return HomeModel(
        homeData: HomeDataModel.formJason(jason?['data']),
        status: jason?['status']);
  }

}