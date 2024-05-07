import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/favourites/data/models/is_favourite/is_favourite_request_body.dart';
import 'package:shuwaikh/features/favourites/data/repos/is_favourite_repo.dart';

part 'is_favourite_state.dart';

class IsFavouriteCubit extends Cubit<IsFavouriteSuccess> {
  IsFavouriteCubit(this._favouriteRepo) : super(IsFavouriteSuccess(false));
  final IsFavouriteRepo _favouriteRepo;
  void isFavouriteStates(int productIdp) async {
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _favouriteRepo.isFavourite(
      token,
      IsFavouriteRequestBody(
        productIdp: productIdp.toString(),
      ),
    );

    if (result.message == 'Product removed from favourites.') {
      emit(IsFavouriteSuccess(false));
    } else {
      emit(IsFavouriteSuccess(true));
    }
  }
}
