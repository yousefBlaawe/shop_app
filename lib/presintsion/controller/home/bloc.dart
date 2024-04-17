import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app_clean/presintsion/controller/home/event.dart';
import 'package:shop_app_clean/presintsion/controller/home/state.dart';

import '../../screens/categories_screen/categories_screen.dart';
import '../../screens/favorite_screen/favorite_screen.dart';
import '../../screens/products_screen/products_Screen.dart';
import '../../screens/setting_screen/setting_screen.dart';

class BlocHome extends Bloc<HomeScreenEvent,HomeState>
{

  static BlocHome getObject(context)
  {
    return BlocProvider.of(context);
  }
  int screenIndex=0;
  List<Widget>lstOfScreen=[
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: ProductsScreen(),
    ),
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: CategoriesScreen(),
    ),
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: FavoriteScreen(),
    ),
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: SettingScreen(),
    ),
  ];
  BlocHome():super(InitHomeState()){
    on<ChangeNaveBarEvent>(_changeNavBar);
  }

  void _changeNavBar(ChangeNaveBarEvent event , Emitter emit) {
    screenIndex =event.index;
    emit(ButtonNaveBarState());
  }

}