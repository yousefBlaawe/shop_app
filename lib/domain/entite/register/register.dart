import 'package:equatable/equatable.dart';
import 'package:shop_app_clean/domain/entite/register/register_data.dart';

class Register extends Equatable
{
  final bool status;
  final String message;
  final RegisterData? registerData;
  Register({required this.registerData,required this.status,required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [status,registerData,message];

}
// {
// "status": true,
// "message": "تم التسجيل بنجاح",
// "data": {
// "name": "yusef ALgazzar",
// "phone": "1845204564",
// "email": "you.abdelrahman@gmail.com",
// "id": 63276,
// "image": "https://student.valuxapps.com/storage/uploads/users/ZiE0I2tAjD_1712093350.jpeg",
// "token": "cLBpNu00rjVjNuUktvFFcqwJSpL8nxJ6iRIqTyuMyxan8bKzUSvgFvZcNmkifP0rqj5DZ6"
// }
