import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/core/app_constante/assets_const.dart';
import 'package:shop_app_clean/presintsion/controller/onboarding/event.dart';
import 'package:shop_app_clean/presintsion/controller/onboarding/state.dart';

import '../../../core/utils/cash_helper.dart';
import '../../screens/login_screen/login_screen.dart';

class OnboardingBloc extends Bloc<OnboardingEvent,OnboardingState>
{
  List<String>imageList =[
    AssetsConst.onboardingOne,
    AssetsConst.onboardingTow,
    AssetsConst.onboardingThree,
  ];

  List<String>titleList=[
    'Welcome to a world of convenient shopping! Get started with Wander&Buy today.',
    'Ditch the mall, embrace the app! Wander&Buy is your new shopping bestie.',
    'Shop your favorite brands, all in one place. Download Wander&Buy  to start browsing now!'
  ];
  bool isLast=false;
  IconData iconOnboarding=Icons.arrow_forward_ios;
  var controllerPageView=PageController();
  static OnboardingBloc getObject(context)
  {
    return BlocProvider.of(context);
  }
  OnboardingBloc():super(IntState()){
    on<ChangePageViewIsLastEvent>((event, emit) {
      isLast=true;
      iconOnboarding=Icons.login;
      emit(SuccessChangePageViewState());
    } );
    on<ChangePageViewIsNotLastEvent>((event, emit) {
      isLast=false;
      iconOnboarding=Icons.arrow_forward_ios;
      emit(SuccessChangePageViewState());
    } );
    on<ChangeIconEvent>((event, emit) {
      if (isLast) {
        cachHelper.SaveData(key: 'submit', val:isLast );
        Navigator.pushAndRemoveUntil(event.context, MaterialPageRoute(builder: (context){
          return const LoginScreen();
        }), (route) => true);
        emit(ChangeIconState());
      }
      else
        {
          controllerPageView.nextPage(duration:const Duration(seconds: 1), curve: Curves.easeInOutQuad);
          emit(ChangeIconState());
        }
    });
    on<SkipEvent>((event, emit) {
      cachHelper.SaveData(key: 'submit', val:isLast );
      Navigator.pushAndRemoveUntil(event.context, MaterialPageRoute(builder: (context){
        return const LoginScreen();
      }), (route) => true);
      emit(SuccessSkipState());
    });
  }
}