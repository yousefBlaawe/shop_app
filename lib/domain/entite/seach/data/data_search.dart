import 'package:equatable/equatable.dart';

class SearchData extends Equatable
{
  final int id;
  final double price;
  final String image;
  final String name;
  const SearchData({required this.price,required this.image,required this.id,required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id,price,image];
}
// "id": 52,
// "price": 25000,
// "old_price": 25000,
// "discount": 0,
// "image": "https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg",
// "name": "ابل ايفون 12 برو ماكس - 256جيجابيت, ازرق",