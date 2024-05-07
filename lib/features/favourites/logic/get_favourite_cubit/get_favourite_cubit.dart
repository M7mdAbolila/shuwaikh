import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/favourites/data/models/get_favourites/get_favourites_response.dart';
import 'package:shuwaikh/features/favourites/data/repos/get_favourite_repo.dart';

part 'get_favourite_state.dart';

class GetFavouriteCubit extends Cubit<GetFavouriteState> {
  GetFavouriteCubit(this._getFavouriteRepo) : super(GetFavouriteState());
  final GetFavouriteRepo _getFavouriteRepo;
  Future<void> getFavourites() async {
    emit(GetFavouriteLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _getFavouriteRepo.getFavourite(token);
    result.fold(
      (failure) => emit(
        GetFavouriteFailure(failure.errMessage),
      ),
      (favourites) => emit(
        GetFavouriteSuccess(favourites),
      ),
    );
  }
}
