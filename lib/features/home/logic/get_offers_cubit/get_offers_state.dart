part of 'get_offers_cubit.dart';

class GetOffersState {}

class GetOffersInitial extends GetOffersState {}

class GetOffersLoading extends GetOffersState {}

class GetOffersSuccess extends GetOffersState {
  final List<Offer>? offers;

  GetOffersSuccess(this.offers);
}

class GetOffersFailure extends GetOffersState {
  final String errMessage;

  GetOffersFailure(this.errMessage);
}
