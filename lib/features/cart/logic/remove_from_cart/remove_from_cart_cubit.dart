import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/cart/data/models/remove_from_cart/remove_from_cart_request_body.dart';
import 'package:shuwaikh/features/cart/data/repos/remove_from_cart_repo.dart';

part 'remove_from_cart_state.dart';

class RemoveFromCartCubit extends Cubit<RemoveFromCartState> {
  RemoveFromCartCubit(this._removeFromCartRepo) : super(RemoveFromCartState());
  final RemoveFromCartRepo _removeFromCartRepo;
  Future<void> removeFromCart(int? id) async {
    emit(RemoveFromCartLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    final result = await _removeFromCartRepo.removeFromCart(
      token,
      RemoveFromCartRequestBody(productId: id),
    );
    result.fold(
      (failue) => emit(
        RemoveFromCartFailure(failue.errMessage),
      ),
      (success) => emit(
        RemoveFromCartSuccess(success.message),
      ),
    );
  }
}
