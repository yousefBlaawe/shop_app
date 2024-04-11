import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app_clean/presintsion/screens/onboarding_screen/onboarding.dart';

class SplashBody extends StatefulWidget
{
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
 late Animation<Offset> animation;
 @override
  void initState() {
    animationController=AnimationController(vsync:this,duration: const Duration(seconds: 1) );
    animation =Tween<Offset>(
      end:Offset.zero,
      begin: Offset(0,10),
    ).animate(animationController);
    animationController.forward();
    navigateTransitionWidget();

  }
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            width: 300,
            decoration:const BoxDecoration(
              image: DecorationImage(
                image:  AssetImage('assets/images/pngegg.png'),
              )
            ),
          ),
          AnimatedBuilder(
             builder: (context,_) {
               return SlideTransition(
                 position: animation,
                 child: Text('Wander & Buy ',
                         style: TextStyle(
                  color: Colors.teal[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                         ),
                         ),
               );
             }, animation: animation,
           )

        ],
      ),
    );
  }
  void navigateTransitionWidget()
  {
    Future.delayed(Duration(seconds: 2),
        (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return const OnboardingScreen();
      }));
        });
  }
}