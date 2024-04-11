import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/core/app_constante/app_const.dart';
import 'package:shop_app_clean/core/service/service_locator.dart';
import 'package:shop_app_clean/core/utils/cash_helper.dart';
import 'package:shop_app_clean/presintsion/controller/categories/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/categories/evet.dart';
import 'package:shop_app_clean/presintsion/controller/home/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/productes/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/productes/event.dart';
import 'package:shop_app_clean/presintsion/screens/description_screen/description.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/Screens/seach_screen/search_screen.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/home_screen.dart';
import 'package:shop_app_clean/presintsion/screens/login_screen/login_screen.dart';
import 'package:shop_app_clean/presintsion/screens/onboarding_screen/onboarding.dart';
import 'package:shop_app_clean/presintsion/screens/register_screen/register_screen.dart';
import 'package:shop_app_clean/presintsion/screens/register_screen/widgets/register_body.dart';
import 'package:shop_app_clean/presintsion/screens/splash_screen/splash.dart';
import 'core/utils/dio_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  DioHelper.init();
 await cachHelper.initail();
    var widget=null;
  if (AppConst.token!=null) {
    if (AppConst.isSubmit) {
      widget=OnboardingScreen();
    }
    else
      {
        widget =LoginScreen();
      }
  }
  else{
    widget =SplashScreen();
  }
  runApp( MyApp(widget) );
}

class MyApp extends StatelessWidget {
  var screen;
  MyApp(this.screen);
  @override
  Widget build(BuildContext context) {
    return   MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>BlocHome()),
        BlocProvider(create: (context)=>SL<HomeProductsBloc>()..add(GetHomeProductsEvent())),
        BlocProvider(create: (context)=>SL<CategoriesBloc>()..add(CategoriesEvent())),

    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: screen ,
      ),
    );
  }
}


