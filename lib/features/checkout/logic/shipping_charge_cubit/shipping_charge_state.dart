part of 'shipping_charge_cubit.dart';

class ShippingChargeState {}

class ShippingChargeLoading extends ShippingChargeState {}

class ShippingChargeSuccess extends ShippingChargeState {
  final List<Shipping>? shipping;

  ShippingChargeSuccess(this.shipping);
}

class ShippingChargeFailure extends ShippingChargeState {
  final String? errMessge;

  ShippingChargeFailure(this.errMessge);
}
