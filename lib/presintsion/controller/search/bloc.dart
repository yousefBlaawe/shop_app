import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/domain/use_case/search_data_use_case.dart';
import 'package:shop_app_clean/presintsion/controller/search/event.dart';
import 'package:shop_app_clean/presintsion/controller/search/state.dart';

class BlocSearch extends Bloc<SearchEvent,SearchDataState>
{
  final searchController=TextEditingController();
  static BlocSearch getObject(context)
  {
    return BlocProvider.of(context);
  }
  SearchDataUseCase searchDataUseCase;
  BlocSearch(this.searchDataUseCase):super(IntSearchState())
  {

    on<SearchDataEvent>((event, emit)async {
      final result=await searchDataUseCase.call(SearchParameter(
        event.Data
      ));
      result.fold(
              (l) => emit(ErrorServerState(error: l.message)),
              (r) {
                if (r.status) {
                  if (event.Data.isEmpty) {
                    emit(ZeroStateData());
                  }
                  else
                    {
                      emit(SuccessSearchState(search: r));
                    }

                }
                else
                  {
                    emit(ErrorSearchState());
                  }
              });
    });
  }
}