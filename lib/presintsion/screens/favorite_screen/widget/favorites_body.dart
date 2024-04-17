import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/core/service/service_locator.dart';
import 'package:shop_app_clean/presintsion/controller/get_favorites/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/get_favorites/event.dart';
import 'package:shop_app_clean/presintsion/controller/get_favorites/state.dart';

import '../../../../../../domain/entite/get_favorites/get_favorites_data_products.dart';

class FavoritesBody extends StatelessWidget
{
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)  =>SL<GetFavoritesBloc>()..add(GetFavoritesDataProductsEvent()),
      child: BlocBuilder<GetFavoritesBloc,GetFavoritesDataProductsState>(builder: (context,state){
        if (state is SuccessGetFavoritesData) {
           return ListView.builder(
               itemCount: state.getFavorites.getFavoritesData.dataList.length,
               itemBuilder: (context,index){
                 return listItem(state.getFavorites.getFavoritesData.dataList[index].getFavoritesDataproducts);
               });
        }
        else
          {
            return Center(child: CircularProgressIndicator(color: Colors.teal[800],backgroundColor:  Colors.grey,));
          }
      }),
    );

   }
  Widget listItem(GetFavoritesDataProducts getFavorites)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          getFavorites.image ,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                height: 120,
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 60,
                      child:  Text(
                        getFavorites.name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style:const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.teal),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${getFavorites.price.round()}',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Colors.teal[800]),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

}