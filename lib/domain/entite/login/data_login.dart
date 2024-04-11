import 'package:equatable/equatable.dart';

class DataLogin extends Equatable
{
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? token;
  DataLogin({
    required this.email,
    required this.name,
    required this.id,
    required this.phone,
    required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,phone,token,email];
}
// {
// "status": true,
// "message": "تم تسجيل الدخول بنجاح",
// "data": {
// "id": 60446,
// "name": "yousefblaawe",
// "email": "yousefblaawe00@gmail.com",
// "phone": "0775687641",
// "image": "https://student.valuxapps.com/storage/uploads/users/yTJgGD4rM4_1700258277.jpeg",
// "points": 0,
// "credit": 0,
// "token": "H7DPahAVdOmtf4WLxmTi6WqSEqqHoz6pT94kKOXqZT3BoB04lv8sycDuRCpMHGwSBWuira"
// }
// }