import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app_clean/core/base_use_case/base_use_case.dart';
import 'package:shop_app_clean/domain/entite/home/home.dart';
import 'package:shop_app_clean/domain/use_case/favorites_use_case.dart';
import 'package:shop_app_clean/presintsion/controller/productes/event.dart';
import 'package:shop_app_clean/presintsion/controller/productes/state.dart';
import 'package:shop_app_clean/presintsion/controller/register/state.dart';

import '../../../domain/entite/home/data/products.dart';
import '../../../domain/entite/seach/data/data.dart';
import '../../../domain/use_case/home_data_use_case.dart';

class HomeProductsBloc extends Bloc<HomeProductsEvent,HomeProductsState>
{
  static Map<dynamic,dynamic>favoritesMap={};
  static HomeProductsBloc getObject(context)
  {
    return BlocProvider.of(context);
  }
  HomeDataUseCae homeDateUseCase;

  HomeProductsBloc(this.homeDateUseCase):super(IntState()){
    on<GetHomeProductsEvent>(_getHomeProductsData );

  }

  FutureOr<void>_getHomeProductsData(HomeProductsEvent event,Emitter<HomeProductsState> state)async {

      emit(LoadingGetData());
      final reuslt=await homeDateUseCase.call(const NoParameter());
      reuslt.fold(
              (l) => emit(ServerFailGetData(serverError: l.message)),
              (r) {
            if (r.status) {
              r.homeData!.productsData!.forEach((element) {
                favoritesMap.addAll({element.id:element.favorites}   );
              });
              emit(SuccessGetData(home: r));
            }
            else
            {
              emit(ErrorGetDate());
            }
          });

  }

}

