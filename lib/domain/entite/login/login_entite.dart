import 'package:equatable/equatable.dart';
import 'package:shop_app_clean/domain/entite/login/data_login.dart';

class Login extends Equatable
{

  final bool status;
  final String message;
  final DataLogin? dataLogin;
  const Login({required this.dataLogin,required this.message,required this.status});
  @override
  // TODO: implement props
  List<Object?> get props => [status,message,dataLogin];

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