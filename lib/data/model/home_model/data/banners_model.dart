import 'package:shop_app_clean/domain/entite/home/data/banners.dart';

class BannersModel extends Banners
{
  BannersModel({required super.id, required super.image});
  factory BannersModel.fromJason(Map<String,dynamic>?jason)
  {
    return BannersModel(
        id: jason?['id'],
        image: jason?['image']);
  }

}