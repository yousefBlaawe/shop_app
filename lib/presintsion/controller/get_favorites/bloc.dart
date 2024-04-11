import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/core/base_use_case/base_use_case.dart';
import 'package:shop_app_clean/presintsion/controller/get_favorites/event.dart';
import 'package:shop_app_clean/presintsion/controller/get_favorites/state.dart';

import '../../../domain/use_case/gat_favorites_use_case.dart';

class GetFavoritesBloc extends Bloc<GetFavoritesDataProductsEvent,GetFavoritesDataProductsState>
{
  GetFavoritesUseCase getFavoritesUseCase;
  GetFavoritesBloc(this.getFavoritesUseCase):super(IntState()){
  on<GetFavoritesDataProductsEvent>(_getFavoritesData);
  }
  FutureOr<void>_getFavoritesData (GetFavoritesDataProductsEvent event, Emitter<GetFavoritesDataProductsState>emit) async{
    final result=await getFavoritesUseCase.call(const NoParameter());
    result.fold((l) => emit(ServerErrorGetFavoritesData(error: l.message)),
            (r) {
          if (r.status) {
            emit(SuccessGetFavoritesData(getFavorites: r));
          }
          else
          {
            emit(ErrorGetFavoritesData());
          }
        });
  }
}