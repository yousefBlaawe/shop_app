import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_clean/presintsion/screens/onboarding_screen/widgets/onboarding_body.dart';

class OnboardingScreen extends StatelessWidget
{
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     backgroundColor:Colors.blueGrey[50],
     body: OnboardingBody(),

   );
  }

}