import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/cart/data/repos/get_cart_repo.dart';

import '../../data/models/get_cart/get_cart_response.dart';


part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit(this._getCartRepo) : super(GetCartState());
  final GetCartRepo _getCartRepo;

  Future<void> getCart() async {
    emit(GetCartLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _getCartRepo.getCart(token);
    result.fold(
      (failure) => emit(
        GetCartFailure(failure.errMessage),
      ),
      (cart) => emit(
        GetCartSuccess(cart),
      ),
    );
  }
}
