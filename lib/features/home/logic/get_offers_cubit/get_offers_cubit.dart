import 'package:bloc/bloc.dart';
import 'package:shuwaikh/features/home/data/models/get_offers/get_offers_response.dart';

import '../../../../core/helpers/user_info_cachce.dart';
import '../../data/models/get_offers/get_offers_requset_body.dart';
import '../../data/repos/get_offers_repo.dart';

part 'get_offers_state.dart';

class GetOffersCubit extends Cubit<GetOffersState> {
  GetOffersCubit(this._getOffersRepo) : super(GetOffersInitial());

  final GetOffersRepo _getOffersRepo;
  Future<void> getOffers(String lang) async {
    emit(GetOffersLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _getOffersRepo.getOffers(
      token,
      GetOffersRequsetBody(lang: lang),
    );

    result.fold(
      (failure) => emit(
        GetOffersFailure(failure.errMessage),
      ),
      (offers) => emit(
        GetOffersSuccess(offers),
      ),
    );
  }
}
