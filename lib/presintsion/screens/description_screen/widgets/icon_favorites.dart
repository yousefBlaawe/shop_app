import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app_clean/core/utils/toast.dart';
import 'package:shop_app_clean/domain/entite/home/data/products.dart';
import 'package:shop_app_clean/presintsion/controller/get_favorites/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/get_favorites/event.dart';

import '../../../../core/service/service_locator.dart';
import '../../../controller/favorites/bloc.dart';
import '../../../controller/favorites/event.dart';
import '../../../controller/favorites/state.dart';
import '../../../controller/productes/bloc.dart';

class IconFavorites extends StatelessWidget
{
  final Products products;
  IconFavorites(this.products);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
        BlocProvider(create: (context)=> SL<FavoritesBloc>()),
      BlocProvider(create: (context)=>SL<GetFavoritesBloc>()..add(GetFavoritesDataProductsEvent()))
    ], 
      child: BlocConsumer<FavoritesBloc,FavoritesState>(
        builder: (context,state){
          return IconButton(onPressed: (){
            FavoritesBloc.getObject(context).add(FavoritesGetDataEvent(id: products.id));
          }, icon: Icon(HomeProductsBloc.favoritesMap[products.id]!?FontAwesomeIcons.solidHeart:FontAwesomeIcons.heart,size: 40,color: Colors.teal[800],));
        },
        listener: (context,state){
          if (state is SuccessGetFavoritesState) {
            defultToast(message:state.favorites.message , state: ToastState.SUCCESS);
          }
        },
      ),
    );
  }

}