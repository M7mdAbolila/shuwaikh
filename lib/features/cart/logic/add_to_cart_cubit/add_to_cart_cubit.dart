import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/cart/data/models/add_to_cart/add_to_cart_request_body.dart';
import 'package:shuwaikh/features/cart/data/repos/add_to_cart_repo.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this._addToCartRepo) : super(AddToCartState());
  final AddToCartRepo _addToCartRepo;
  Future<void> addToCart(AddToCartRequestBody addToCartRequestBody) async {
    emit(AddToCartLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _addToCartRepo.addToCart(token, addToCartRequestBody);
    result.fold(
      (failure) => emit(
        AddToCartFailure(failure.errMessage),
      ),
      (response) => emit(
        AddToCartSuccess(response.message),
      ),
    );
  }
}
