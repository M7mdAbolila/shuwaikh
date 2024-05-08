part of 'offer_details_cubit.dart';

class OfferDetailsState {}

class OfferDetailsLoading extends OfferDetailsState {}

class OfferDetailsSuccess extends OfferDetailsState {
  OfferDetailsResponse offerDetailsResponse;
  OfferDetailsSuccess(this.offerDetailsResponse);
}

class OfferDetailsFailure extends OfferDetailsState {
  String errMessage;
  OfferDetailsFailure(
    this.errMessage,
  );
}
