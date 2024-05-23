import 'package:bloc/bloc.dart';
import 'package:shuwaikh/features/Products_page/data/models/products_page_request_body.dart';
import 'package:shuwaikh/features/Products_page/data/models/products_page_response.dart';
import 'package:shuwaikh/features/Products_page/data/repos/products_page_repo.dart';

import '../../../../core/helpers/user_info_cachce.dart';

part 'products_page_state.dart';

class ProductsPageCubit extends Cubit<ProductsPageState> {
  ProductsPageCubit(this.productsPageRepo) : super(ProductsPageInitial());
  final ProductsPageRepo productsPageRepo;
  Future<void> emitProductsPageStates(String lang) async {
    emit(ProductsPageLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await productsPageRepo.productsPage(
      token,
      ProductsPageRequestBody(lang: lang),
    );
    result.fold(
      (failure) => emit(
        ProductsPageFailure(failure.errMessage),
      ),
      (response) => emit(
        ProductsPageSuccess(response),
      ),
    );
  }
}
