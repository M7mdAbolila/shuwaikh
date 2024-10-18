import 'package:bloc/bloc.dart';
import 'package:shuwaikh/features/product_details/data/models/product_details_response.dart';
import 'package:shuwaikh/features/product_details/data/repos/product_details_repo.dart';

import '../../../../core/helpers/user_info_cachce.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._productDetailsRepo) : super(ProductDetailsState());
  final ProductDetailsRepo _productDetailsRepo;

  void getProductDetails(String id) async {
    emit(ProductDetailsLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _productDetailsRepo.getProductDetails(token, id);
    result.fold(
      (failue) => emit(
        ProductDetailsFailure(failue.errMessage),
      ),
      (productDetails) => emit(
        ProductDetailsSuccess(productDetails.data!.productDetails),
      ),
    );
  }
}
