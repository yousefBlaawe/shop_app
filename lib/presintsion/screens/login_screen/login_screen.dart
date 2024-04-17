import 'package:flutter/material.dart';
import 'package:shop_app_clean/presintsion/screens/login_screen/widgets/login_body.dart';

class LoginScreen extends StatelessWidget
{
   const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.blueGrey[50],
      body: LoginBody() ,
    );
  }

}