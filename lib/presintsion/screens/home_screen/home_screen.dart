import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/presintsion/controller/home/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/home/state.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/widgets/bottomNavBar.dart';


class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<BlocHome,HomeState>(
     builder: (context,state){
    return   Scaffold(
         backgroundColor: Colors.blueGrey[50],
         body:  BlocHome.getObject(context).lstOfScreen[BlocHome.getObject(context).screenIndex],
         bottomNavigationBar: BottomNaveBarScreen(),
       );
     },
   );
  }

}