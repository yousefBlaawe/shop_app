import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app_clean/core/utils/cash_helper.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/home_screen.dart';
import 'package:shop_app_clean/presintsion/screens/login_screen/login_screen.dart';
import 'package:shop_app_clean/presintsion/screens/onboarding_screen/widgets/page_view_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingBody extends StatefulWidget
{
  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  List<String>imageList =[
    'assets/images/onpoarding1.jpg',
    'assets/images/onpoarding2.jpg',
    'assets/images/onporading3.jpg',

  ];

  List<String>titleList=[
    'Welcome to a world of convenient shopping! Get started with Wander&Buy today.',
    'Ditch the mall, embrace the app! Wander&Buy is your new shopping bestie.',
    'Shop your favorite brands, all in one place. Download Wander&Buy  to start browsing now!'
  ];
  bool isLast=false;
  IconData iconOnboarding=Icons.arrow_forward_ios;
  var controllerPageView=PageController();

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 600,
          child: PageView.builder(
            controller: controllerPageView,
              itemBuilder: (context,index){

                return PageViewBody(image: imageList[index],title: titleList[index],);

              },
            onPageChanged: (index){
              if (index==imageList.length-1) {
                setState(() {
                  isLast=true;
                  iconOnboarding=Icons.login;
                });
              }
              else {
                setState(() {
                  isLast=false;
                  iconOnboarding=Icons.arrow_forward_ios;
                });
              }
            },
            itemCount: imageList.length,
          ),
        ),
       const SizedBox(height: 50,),
        SmoothPageIndicator(

            controller: controllerPageView,
            effect: const SlideEffect(

              activeDotColor: Colors.blueGrey,
              dotColor: Colors.teal,

            ),
            count: imageList.length),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Row(
            children: [
              TextButton(onPressed: (){
                submit();
              },
                  child: const Text(
                'Skip',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.teal
                ),
              )),
              const Spacer(),
              FloatingActionButton(onPressed: (){

                if (isLast) {
                  submit();
                }
                else
                  {

                  controllerPageView.nextPage(duration:const Duration(seconds: 1), curve: Curves.easeInOutQuad);
                }
              },
                backgroundColor: Colors.teal,
              child: Icon(iconOnboarding,color: Colors.white,),
              ),
            ],
                   ),
         ),
      ],
    );
  }
  void submit(){
    cachHelper.SaveData(key: 'submit', val:isLast );
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
      return LoginScreen();
    }), (route) => true);
  }
}