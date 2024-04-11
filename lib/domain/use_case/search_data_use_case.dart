import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_clean/core/base_use_case/base_use_case.dart';
import 'package:shop_app_clean/core/exceptions/failuer.dart';
import 'package:shop_app_clean/domain/entite/seach/search.dart';
import 'package:shop_app_clean/domain/repository/base_shop_repository.dart';

class SearchDataUseCase extends BaseUseCase<Search,SearchParameter>
{
  BaseShopRepository baseShopRepository;
  SearchDataUseCase(this.baseShopRepository);
  @override
  Future<Either<Failure, Search>> call(Parameter)async {
    return await baseShopRepository.getSearchData(Parameter);
  }

}
class  SearchParameter extends Equatable
{
  final String searchText ;
  SearchParameter(this.searchText);

  @override
  // TODO: implement props
  List<Object?> get props => [searchText];

}