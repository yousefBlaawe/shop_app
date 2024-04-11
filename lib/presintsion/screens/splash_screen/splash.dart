import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_clean/presintsion/screens/splash_screen/widgets/splash_body.dart';

class SplashScreen extends StatelessWidget
{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.blueGrey[50],
      body:const SplashBody(),
    );
  }
  
}