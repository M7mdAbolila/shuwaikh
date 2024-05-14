import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/home/data/repos/get_categories_repo.dart';

import '../../data/models/get_categories/get_categories_requset_body.dart';
import '../../data/models/get_categories/get_categories_response.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this._categoriesRepo) : super(GetCategoriesInitial());

  final GetCategoriesRepo _categoriesRepo;

  Future<void> getCategories(String lang) async {
    emit(GetCategorieLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _categoriesRepo.getCategories(
      token,
      GetCategoriesRequsetBody(lang: lang),
    );

    result.fold(
      (failure) => emit(
        GetCategoriesFailure(failure.errMessage),
      ),
      (categories) => emit(
        GetCategoriesSuccess(categories),
      ),
    );
  }
}
