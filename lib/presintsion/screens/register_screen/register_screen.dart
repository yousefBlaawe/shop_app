
import 'package:flutter/material.dart';
import 'package:shop_app_clean/presintsion/screens/register_screen/widgets/register_body.dart';

class RegisterScreen extends StatelessWidget
{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    backgroundColor:Colors.blueGrey[50],
    body: RegisterBody(),
  );
  }

}