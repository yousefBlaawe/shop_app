import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shop_app_clean/presintsion/controller/home/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/home/event.dart';
import 'package:shop_app_clean/presintsion/controller/home/state.dart';

class BottomNaveBarScreen extends StatelessWidget
{
  Color? backGroundColors=Colors.teal[800];
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<BlocHome,HomeState>(
      builder: (BuildContext context, state) {
        return  GNav(
            // rippleColor: Colors.grey[800], // tab button ripple color when pressed
            // hoverColor: Colors.grey[700], // tab button hover color
          // backgroundColor: Colors.blueGrey[50],
          backgroundColor: backGroundColors!,
            haptic: true, // haptic feedback
            // tabBorderRadius: 15,
            // tabActiveBorder: Border.all(color: Colors.white, width: 1), // tab button border
            tabBorder: Border.all(color: Colors.teal, width: 1), // tab button border
            // tabShadow: [BoxShadow(color: Colors.teal.withOpacity(0.5), blurRadius: 8)], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 900), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey[800], // unselected icon color
            activeColor: Colors.white, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor: Colors.teal.withOpacity(0.1), // selected tab background color
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),

          onTabChange:(index){
            BlocHome.getObject(context).add(ChangeNaveBarEvent(index: index));
          },
          selectedIndex: BlocHome.getObject(context).screenIndex,
          tabs: [
            GButton(icon: FontAwesomeIcons.houseMedical,text: 'Home',iconColor: Colors.teal[200]),
            GButton(icon: FontAwesomeIcons.asymmetrik,text: 'Category',iconColor: Colors.teal[200],),
            GButton(icon: FontAwesomeIcons.heart,text: 'Favorite',iconColor: Colors.teal[200],),
            GButton(icon: Icons.settings,text: 'Setting',iconColor: Colors.teal[200],),
          ],

        );
      },

    );
  }
  
}