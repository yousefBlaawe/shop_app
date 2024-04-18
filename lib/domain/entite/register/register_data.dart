import 'package:equatable/equatable.dart';

class RegisterData extends Equatable
{
  final String? name;
  final String? phone;
  final String? email;
  final int? id;
  final String? token;
  const RegisterData({required this.phone,required this.name,required this.token,required this.email,required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [name,phone,token,id,email];


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
// }