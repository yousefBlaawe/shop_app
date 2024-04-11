import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/core/base_use_case/base_use_case.dart';
import 'package:shop_app_clean/presintsion/controller/categories/evet.dart';
import 'package:shop_app_clean/presintsion/controller/categories/state.dart';

import '../../../domain/use_case/categories_use_case.dart';

class CategoriesBloc extends Bloc<CategoriesEvent,CategoriesState>
{
  CategoriesUseCase categoriesUseCase;
  CategoriesBloc(this.categoriesUseCase):super(IntState()){
    on<CategoriesEvent>(_getCategories);
  }
  FutureOr<void>_getCategories(CategoriesEvent event, Emitter<CategoriesState> emit)async {
    final result=await categoriesUseCase.call(const NoParameter());
    result.fold((l) => emit(ServerErrorCategoriesState(error: l.message)),
            (r) {
          if (r.status) {
            emit(SuccessCategoriesState(categories: r));
          }
          else
          {
            emit(ErrorCategoriesState());
          }
        });
  }
}