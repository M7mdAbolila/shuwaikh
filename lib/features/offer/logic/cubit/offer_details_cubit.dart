import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/offer/data/models/offer_details_respone.dart';
import 'package:shuwaikh/features/offer/data/repos/offer_details_repo.dart';

part 'offer_details_state.dart';

class OfferDetailsCubit extends Cubit<OfferDetailsState> {
  OfferDetailsCubit(this._offerDetailsRepo) : super(OfferDetailsState());
  final OfferDetailsRepo _offerDetailsRepo;
  Future<void> getOfferDetails(int id) async {
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _offerDetailsRepo.getOfferDetails(token, id);
    result.fold(
      (failure) => emit(
        OfferDetailsFailure(failure.errMessage),
      ),
      (offer) => emit(
        OfferDetailsSuccess(offer),
      ),
    );
  }
}
