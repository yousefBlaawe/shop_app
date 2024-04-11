import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/presintsion/controller/favorites/event.dart';
import 'package:shop_app_clean/presintsion/controller/favorites/state.dart';
import 'package:shop_app_clean/presintsion/controller/productes/bloc.dart';

import '../../../domain/use_case/favorites_use_case.dart';

class FavoritesBloc extends Bloc<FavoritesEvent ,FavoritesState>
{
  FavoritesUseCase favoritesUseCase;

  static FavoritesBloc getObject(context){
    return BlocProvider.of(context);
  }
  FavoritesBloc(this.favoritesUseCase):super(IntFavoritesState()){
    on<FavoritesGetDataEvent>((event, emit)async {
      HomeProductsBloc.favoritesMap[event.id]=!HomeProductsBloc.favoritesMap[event.id];
      emit(ChangeFavoritesIcon());
      final result=await favoritesUseCase.call(FavoritesParameter(event.id));
      result.fold((l) => emit(ServerErrorGetFavoritesState(error: l.message)),
              (r) {
        if (r.status) {
          emit(SuccessGetFavoritesState(favorites: r));
        }
        else
          {
            HomeProductsBloc.favoritesMap[event.id]=!HomeProductsBloc.favoritesMap[event.id];
            emit(ErrorGetFavoritesState());
          }
              });
    });
  }
}